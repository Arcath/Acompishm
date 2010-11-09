module ApplicationHelper
	def title(s)
		content_for(:title) { s }
	end
end
