# Recebe sinal serial do sensor PIR do Arduino e envia alerta por email

# gems utilizadas
require "serialport"
require "gmail"


#parametros para a porta serial
port_str = "/dev/cu.usbmodem641"  #may be different for you
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE
sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

#parametros para o gmail
username = "email a ser utilizado"
password = "senha"
gmail = Gmail.connect(username, password)

#send email
gmail.deliver do
  to "email do destinatario"
  subject "Residencia invadida"
  text_part do
    body "A casa foi invadida veja a foto anexo"
  end
  html_part do
    body "A casa foi invadida veja a foto anexo"
  end
  add_file "/file.JPG" #arquivo a ser anexado
  gmail.logout
end

#reinicia a aplicativo
while true do
   while (i = sp.gets.chomp) do       # see note 2
      puts i
      #puts i.class #String
    end
end

sp.close                       #see note 1