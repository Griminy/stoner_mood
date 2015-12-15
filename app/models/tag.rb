class Tag < ActiveRecord::Base
	self.table_name = 'tags'
	validates_presence_of :name
end