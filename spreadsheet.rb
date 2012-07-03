require "rubygems"
require "google_drive"

# Logs in.
# You can also use OAuth. See document of
# GoogleDrive.login_with_oauth for details.
file = File.new("key")
user = file.gets.chomp
password = file.gets.chomp
session = GoogleDrive.login(user, password)

# First worksheet of
# https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg
#ws = session.spreadsheet_by_key("pz7XtlQC-PYx-jrVMJErTcg").worksheets[0]

#https://docs.google.com/spreadsheet/ccc?key=0AnC3py1C1o3wdC0tUWNEYjB0UVJOV0Q3N3dRek05LUE#gid=1
ws = session.spreadsheet_by_key("0AnC3py1C1o3wdC0tUWNEYjB0UVJOV0Q3N3dRek05LUE").worksheets[0]

# Gets content of A2 cell.
p ws[2, 1]  #==> "hoge"

# Changes content of cells.
# Changes are not sent to the server until you call ws.save().
ws[5, 1] = "casiano"
ws[5, 2] = "juana"
ws.save()

# Dumps all cells.
#for row in 1..ws.num_rows
#  for col in 1..ws.num_cols
#    p ws[row, col]
#  end
#end

# Yet another way to do so.
#p ws.rows  #==> [["fuga", ""], ["foo", "bar]]

# Reloads the worksheet to get changes by other clients.
#ws.reload()
