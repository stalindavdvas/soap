require 'savon'

# URL del WSDL del servicio SOAP
wsdl_url = 'http://example.com/service?wsdl'  # Cambia esta URL por la URL real de tu servicio SOAP

# Crear un cliente SOAP
client = Savon.client(wsdl: wsdl_url)

# Llamada al servicio con los parámetros requeridos
response = client.call(:say_hello, message: { name: 'Stalin' })

# Imprimir la respuesta del servicio SOAP
puts response.body
