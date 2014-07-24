module MailHelpers

  def last_email
      ActionMailer::Base.deliveries[0]
  end

  # Can be used like:
  #  extract_token_from_email(:reset_password)
  def extract_token_from_email(token_name)
    mail_body = last_email.body.to_s
    mail_body[/#{token_name.to_s}_token=([^"]+)/, 1]
  end

end

World(MailHelpers)