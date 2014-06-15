if ENV['development']
  path = File.join(Rails.root, "config/twilio.yml")
  TWILIO_CONFIG = YAML.load(File.read(path))[Rails.env] || {'sid'=>'', 'from'=>'', 'token'=>''}
end