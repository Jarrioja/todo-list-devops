

# Usa una imagen base oficial y ligera de Node.js versión 18 con Alpine
FROM node:18-alpine

# Establecer argumentos de construcción que serán pasados como variables de entorno
ARG MYSQL_HOST
ARG MYSQL_USER
ARG MYSQL_DB
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

# Definir las variables de entorno dentro de la imagen
ENV MYSQL_HOST=$MYSQL_HOST
ENV MYSQL_USER=$MYSQL_USER
ENV MYSQL_DB=$MYSQL_DB
ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

# Establece el directorio de trabajo
WORKDIR /app

# Copia el package.json y el package-lock.json
COPY package*.json ./

# Instala las dependencias de la aplicación
RUN npm install --production

# Copia el resto del código de la aplicación
COPY . .

# Expon el puerto que la aplicación utilizará
EXPOSE 3000

# Define el comando para ejecutar la aplicación
CMD ["npm", "start"]