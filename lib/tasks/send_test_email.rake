# frozen_string_literal: true

task :send_test_email, [:to_email] => :environment do |_task, args|
  to_email = args[:to_email]

  if to_email
    delivery = TestMailer.with(to_email: to_email).test_email.deliver_now!
    if delivery.success?
      puts "Email sent to #{to_email}! (#{delivery[:id]})"
    else
      puts "Email failure!"
      puts "--------------"
      puts delivery.inspect
      puts "--------------"
    end
  else
    puts 'Usage: rails "send_test_email[sample@email.com]"'
  end
end
