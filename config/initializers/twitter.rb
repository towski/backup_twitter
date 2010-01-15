OAuthConfig = YAML.load(File.read(RAILS_ROOT + '/config' + '/oauth.yml'))[Rails.env]
