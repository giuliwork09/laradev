#!/bin/ash

php artisan migrate &

# Iniciar Laravel backend
php artisan serve --host 0.0.0.0 --port=8000 &

# Iniciar Vite frontend
npm run dev -- --host 0.0.0.0 --port 5173 &

# Mantener el contenedor corriendo
wait
