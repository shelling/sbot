Slack.configure { |config| config.token = Rails.application.secrets.slack[:access_token] }
