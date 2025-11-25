#!/bin/ash
set -e

echo "HOLA"

# Inicialización solo si la DB de sistema no existe
if [ ! -d /var/lib/mysql/mysql ]; then
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal
    echo ">> Iniciando MariaDB temporalmente..."
    /usr/bin/mariadbd --user=mysql --datadir=/var/lib/mysql &
    pid=$!

    echo ">> Esperando a que MariaDB esté lista..."
    until mariadb -u root -e "SELECT 1;" >/dev/null 2>&1; do
        sleep 1
    done
    echo ">> MariaDB lista."

    echo ">> Configurando usuarios..."

    mariadb -u root <<EOF
-- Configurar root con contraseña y mysql_native_password
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';

-- Crear usuario dev accesible desde cualquier host
CREATE USER IF NOT EXISTS '${DEV_USER}'@'%' IDENTIFIED BY '${DEV_PASS}';
GRANT ALL PRIVILEGES ON *.* TO '${DEV_USER}'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
EOF

    # Importar archivos SQL
    if [ -d /dbs ]; then
        for f in /dbs/*.sql; do
            [ -e "$f" ] || continue
            echo ">> Importando $f"
            mariadb -u root -p"${MYSQL_ROOT_PASS}" < "$f"
        done
    fi

    echo ">> Apagando MariaDB temporal..."
    kill "$pid"
    wait "$pid"
fi

echo ">> Iniciando MariaDB definitivo..."
exec /usr/bin/mariadbd --user=mysql --datadir=/var/lib/mysql --skip-networking=0 --bind-address=0.0.0.0
