require "./lib/email"
ENV['MANDRILL_APIKEY'] = 'lF-Pq1M5RPbrphuAgx_4LA'

SSH_USER = 'root'
SSH_HOST = 'www.example.com'
SSH_DIR  = '/var/www/html/www.example.com'
ACTIVE_EMAIL = '2013_october/index.html'
SENDER = 'ryan.parsley@rockfishinteractive.com'
RECIPIENT_LIST = [  
       {  
         :email=> "rockfishinteractive1.9045e3b.new@emailtests.com",
         :name=> "Litmus"  
       },
       {  
         :email=> "ryan.parsley@rockfishinteractive.com",  
         :name=> "Recipient2"  
       }    
     ]
 
desc "Build the website from source"
task :build do
  puts "## Building website"
  status = system("middleman build --clean")
  puts status ? "OK" : "FAILED"
end
 
desc "Run the preview server at http://localhost:4567"
task :preview do
  system("middleman server")
end
 
desc "Deploy website via rsync"
task :deploy do
  puts "## Deploying website via rsync to #{SSH_HOST}"
  status = system("rsync -avze 'ssh' --delete build/ #{SSH_USER}@#{SSH_HOST}:#{SSH_DIR}")
  puts status ? "OK" : "FAILED"
end
 
desc "Build and deploy website"
task :gen_deploy => [:build, :deploy] do
end

desc "Send a test email"
task :send do
  puts "## Sending #{ACTIVE_EMAIL}"
  m = MyEmailer.new
  m.rakeSend("build/#{ACTIVE_EMAIL}", SENDER, RECIPIENT_LIST)
end

desc "Build and send"
task :gen_send => [:build, :send] do
end

