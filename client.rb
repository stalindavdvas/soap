require 'savon'

# Cargar el WSDL desde el archivo local
wsdl_url = 'calculator.wsdl'

# Configurar el cliente SOAP con endpoint y namespace correctos
client = Savon.client(
  wsdl: wsdl_url,
  endpoint: 'http://localhost:4567/calculator',  # Apuntar al servidor SOAP
  namespace: 'http://example.com/calculator',    # Usar el namespace correcto
  log: true,
  pretty_print_xml: true
)

# Llamar a la operación 'Add'
response = client.call(:add, message: { intA: 10, intB: 5 })

# Mostrar la respuesta
puts response.body
