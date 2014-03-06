require 'sequel'
if development?
	require 'sqlite3'
end
if production?
	require 'pg'
end

DB = Sequel.connect(ENV['DATABASE_URL']) || Sequel.sqlite('./development.sqlite3')

# DB.create_table :messages do
# 	primary_key :id
# 	text :message
# 	text :name
# end

class Message < Sequel::Model
end