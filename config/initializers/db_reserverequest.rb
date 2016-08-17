

# save stats database settings in global var
DB_RESERVEREQUEST = YAML::load(ERB.new(File.read(Rails.root.join("config","database_reserverequest.yml"))).result)[Rails.env]