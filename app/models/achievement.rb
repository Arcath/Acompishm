class Achievement < ActiveRecord::Base
	def given_to
		if self.user_id
			User.find_by_id(self.user_id)
		else
			User.new
		end
	end
end
