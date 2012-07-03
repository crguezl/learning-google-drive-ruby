require "rubygems"
require "google_drive"

# Logs in.
# You can also use OAuth. See document of
# GoogleDrive.login_with_oauth for details.
# developing key
file = File.new("key")
user = file.gets.chomp
password = file.gets.chomp
session = GoogleDrive.login(user, password)

# Gets list of remote files.
for file in session.files
  p file.title
end

# Uploads a local file.
session.upload_from_file("example.rb", "google_drive_example.rb", :convert => false)

# Downloads to a local file.
file = session.file_by_title("google_drive_example.rb")
file.download_to_file("google_drive_example.rb")

# Updates content of the remote file.
file.update_from_file("example.rb")

