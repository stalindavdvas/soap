# Usa una imagen base oficial de Ruby
FROM ruby:3.2

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY Gemfile* ./

# Instala las dependencias
RUN bundle install

# Copia el resto de la aplicación
COPY . .

# Expón el puerto en el que correrá la aplicación (si es necesario)
EXPOSE 4567

# Comando para ejecutar la aplicación (ajusta esto según tu script)
CMD ["ruby", "server.rb"]
