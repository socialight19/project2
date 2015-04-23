module ApplicationHelper
	def edit_access(question)
		if logged_in? && current_user.id == question.asked_by
			return true
		else 
			false
		end
	end
end
