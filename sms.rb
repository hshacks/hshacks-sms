#!/usr/bin/ruby
require 'csv'
require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC4adec58f8d48fb0ea9b78a447610fd6b'
auth_token = '2392fad532397ce9f4eb9ad1083f30a4'

@client = Twilio::REST::Client.new account_sid, auth_token
CSV.foreach("checkin.csv") do |row|
  # row phone numbers are in
  number = row[3]
  begin
    number.gsub(/[() -]/, '')
    next unless number.length == 10
    print "Sending message to #{number}...\n"
    @client.account.messages.create(
      :from => '+14087035308',
      :to => "+1#{number}",
      :body => "HSHacks: HellYeah" 
    )
  rescue
    next
  end
end