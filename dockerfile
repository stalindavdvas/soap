# Usa una imagen oficial de Ruby como base
FROM ruby:3.2

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo Gemfile y Gemfile.lock al contenedor
COPY Gemfile Gemfile.lock ./

# Instala las dependencias definidas en el Gemfile
RUN bundle install

# Copia el resto de la aplicación al contenedor
COPY . .

# Expone el puerto donde correrá la aplicación (ajusta según tu servidor)
EXPOSE 4567

# Comando para ejecutar la aplicación
CMD ["ruby", "server.rb"]
