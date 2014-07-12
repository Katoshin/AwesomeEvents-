class Music < ActiveRecord::Base
	has_many :checks
	belongs_to :owner, class_name: 'User'

	def created_by?(user)
		return false unless user
		owner_id == user.id
	end
end
