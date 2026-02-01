# Configure Obscenity profanity filter
Obscenity.configure do |config|
  # Use the default blacklist
  config.blacklist = Obscenity::Blacklist.new
  
  # Set to use the default profanity list
  config.replacement = :stars
end
