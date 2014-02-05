require 'rubygems'
require 'mandrill'

ENV['MANDRILL_APIKEY'] = 'lF-Pq1M5RPbrphuAgx_4LA'
class MyEmailer
  def rakeSend(url, from, to)
    m = Mandrill::API.new
    message = {  
     :subject=> "Hello from the Mandrill API",  
     :from_name=> "Your name",  
     :text=>"Hi message, how are you?",  
     :to=>to,  
     :html=> File.read(url).to_s,  

     :from_email=> from
    }  
    sending = m.messages.send message
    puts sending
  end
end
