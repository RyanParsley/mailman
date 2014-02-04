require 'rubygems'
require 'mandrill'
require 'net/http'

ENV['MANDRILL_APIKEY'] = 'lF-Pq1M5RPbrphuAgx_4LA'
class MyEmailer
  def send(url, from)
    m = Mandrill::API.new
    message = {  
     :subject=> "Hello from the Mandrill API",  
     :from_name=> "Your name",  
     :text=>"Hi message, how are you?",  
     :to=>[  
       {  
         :email=> "rmparsley@gmail.com",  ## this uses the email argument passed into this method
         :name=> "Recipient1"  
       }  
     ],  
     :html=> Net::HTTP.get(URI.parse("http://127.0.0.1:4567/2013_october/")),  
     :from_email=> from
    }  
    sending = m.messages.send message
    puts sending
  end
end
