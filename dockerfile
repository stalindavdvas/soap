# Usa una imagen oficial de Ruby como base
FROM ruby:3.2

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Configura DNS si es necesario
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf && echo "nameserver 8.8.4.4" >> /etc/resolv.conf

# Copia el archivo Gemfile y Gemfile.lock al contenedor
COPY Gemfile Gemfile.lock ./

# Instala las dependencias definidas en el Gemfile
RUN for i in 1 2 3 4 5; do bundle install && break || sleep 15; done

# Copia el resto de la aplicación al contenedor
COPY . .

# Expone el puerto donde correrá la aplicación
EXPOSE 4567

# Comando para ejecutar la aplicación usando puma y rackup
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0"]
