if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:              'smtp.mailgun.org',
    port:                 '587',
    authentication:       :plain,
    user_name:            ENV['MAILGUN_SMTP_USERNAME'],
    password:             ENV['MAILGUN_SMTP_PASSWORD'],
    domain:               'app0bf2e59d708c4f379d05a04c70a34d0f.mailgun.org',
    enable_starttls_auto: true
  }
end