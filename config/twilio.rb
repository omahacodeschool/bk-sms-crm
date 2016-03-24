require 'rubygems'
require 'twilio-ruby' 
 
# put your own credentials here
# Currently using TEST credentials 
account_sid = 'AC59a4589728bc6d4fafe8c651f8964466' 
auth_token = '5544e7634c310a35ae281ee77aff0bab' 

# Your TEST credentials can currently be used to interact with the following three resources:

# Buying phone numbers: POST /2010-04-01/Accounts/{AC59a4589728bc6d4fafe8c651f8964466}/IncomingPhoneNumbers

# Sending SMS messages: POST /2010-04-01/Accounts/{AC59a4589728bc6d4fafe8c651f8964466}/SMS/Messages

# Making calls: POST /2010-04-01/Accounts/{AC59a4589728bc6d4fafe8c651f8964466}/Calls

# Requests to any other resource with test credentials will receive a 403 Forbidden response. In the future, we may enable these resources for testing as well.
 
# set up a client to talk to the Twilio REST API 
@client = Twilio::REST::Client.new account_sid, auth_token 
 
# Sending an SMS:

@client.account.messages.create({
  :from => '+14028502532', 
  :to => '+14022133739', 
  :body => 'Hey User! Twilio says Hello!', 
  :media_url => 'http://farm2.static.flickr.com/1075/1404618563_3ed9a44a3a.jpg', 
})


