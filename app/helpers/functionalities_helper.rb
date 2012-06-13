module FunctionalitiesHelper

	def rel_count status
		if status
			Functionality.where(:status => status).size	
		else
			Functionality.all.size	
		end
	end

	def b_count user
		Board.where(:user_id => user.id).size
	end
end
