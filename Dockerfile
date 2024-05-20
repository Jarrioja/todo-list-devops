# Usa una imagen base oficial y ligera de Node.js versión 18 con Alpine
FROM node:18-alpine

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