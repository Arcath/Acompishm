module ApplicationHelper
	def title(s)
		content_for(:title) { s }
	end
	
	def path_to_home
		if current_user
			userhome_path
		else
			root_path
		end
	end
end
