# laradev
Este es un proyecto personal de Dockerizacion tanto de Laravel como de Maria DB, sin usar imagenes prediseñadas para los mismos y dependiendo completamente de repositorios del sistema operativo Alpine.

Para poder utilizar este proyecto, debe configurar un .env que contenga:
- La ruta de sus proyectos PHP/Laravel. La variable es RUTA_DEV
- La ruta de las bases de datos a importar, en formato sql. La variable es RUTA_SQÑ
- Una contraseña para el usuario ROOT de forma local- La variable es MYSQL_ROOT_PASS
- El usuario y contraseña del usuario DEV que utilizaran. Las variables son DEV_USER y DEV_PASS

DEBE cargar estas variables en un .env, la ausencia de los mismos recae que el proyecto no funcionara.

Este proyecto utiliza:
- Apache 2
- PHP 8.3
- Laravel 12.x
- MariaDB
