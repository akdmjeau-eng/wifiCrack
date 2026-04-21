#!/bin/bash

# 1. Limpiar rastro de errores previos y configurar el display
export DISPLAY=${DISPLAY:-:0}

# 2. Intentar autorizar al root si estamos en un entorno gráfico
xhost +local:root > /dev/null 2>&1

# 3. Ejecutar el binario dropcan o xterm
# Usamos 'cat' para registrar si hubo errores de salida
./dropcan 2> >(cat > nexus_error.log)

if [ $? -ne 0 ]; then
    echo "[!] Error detectado. Revisa nexus_error.log"
    cat nexus_error.log
fi