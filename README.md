# laradev
Este es un proyecto personal de Dockerizacion tanto de Laravel como de Maria DB, sin usar imagenes prediseñadas para los mismos y dependiendo completamente de repositorios del sistema operativo Alpine.

Para poder utilizar este proyecto, debe configurar un .env que contenga:
- La ruta de su proyecto Laravel. La variable es RUTA_DEV
- La ruta de la base de datos a importar, en formato sql. La variable es RUTA_SQL
- Una contraseña para el usuario ROOT de forma local- La variable es MYSQL_ROOT_PASS
- El usuario y contraseña del usuario DEV que utilizaran. Las variables son DEV_USER y DEV_PASS

DEBE cargar estas variables en un .env, la ausencia de los mismos recae que el proyecto no funcionara.

Este proyecto utiliza:
- PHP 8.3 (latest)
- Laravel 12.x (latest)
- MariaDB (latest)

Se planea adaptar para que corra multiples proyectos, debido a la limitacion de consumo de recursos preferi no explotar esa habilidad aun