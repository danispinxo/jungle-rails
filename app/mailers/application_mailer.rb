class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def check_mail
    # Rails.logger.info in place of puts
    
    ActionMailer::Base.deliveries.each { |mail|
      puts mail
    }

  end

end

