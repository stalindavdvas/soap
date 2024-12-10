require 'sinatra'
require 'builder'
require 'nokogiri'

post '/calculator' do
  # Obtener los parámetros del mensaje SOAP
  soap_request = Nokogiri::XML(request.body.read)
  intA = soap_request.at_xpath('//intA').content.to_i
  intB = soap_request.at_xpath('//intB').content.to_i

  # Realizar la operación de suma
  result = intA + intB

  # Construir la respuesta SOAP
  builder do |xml|
    xml.soapenv(:Envelope, 'xmlns:soapenv' => 'http://schemas.xmlsoap.org/soap/envelope/') do
      xml.soapenv(:Body) do
        xml.AddResponse('xmlns' => 'http://example.com/calculator') do
          xml.result result
        end
      end
    end
  end
end
