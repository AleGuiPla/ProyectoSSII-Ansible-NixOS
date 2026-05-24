#!/bin/bash

USUARIO="alumno"
PASSWORD="alumno"

BASE_DIR="/home/$USUARIO/DAM1"

if id "$USUARIO" &>/dev/null; then
	echo "El usuario '$USUARIO' ya existe."
else
	useradd -m -s /bin/bash "$USUARIO"
	echo "$USUARIO:$PASSWORD" | chpasswd
	echo "Usuario '$USUARIO' creado correctamente."
fi

mkdir -p "$BASE_DIR"/{BBDD,SSII,PROGRAMACION,LENGUAJES,ENTORNOS}

chown -R "$USUARIO":"$USUARIO" "/home/$USUARIO/DAM1"

echo "Estructura de carpetas creada en $BASE_DIR"
