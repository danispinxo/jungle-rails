class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def check_mail
    
    ActionMailer::Base.deliveries.each { |mail|
      puts mail
    }

  end

end

