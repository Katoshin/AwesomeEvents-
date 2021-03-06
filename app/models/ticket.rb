class Music < ActiveRecord::Base
	has_many :checks
	belongs_to :owner, class_name: 'User'

	validates :comment, length: { maximum: 30 }, allow_blank: true
	
	def created_by?(user)
		return false unless user
		owner_id == user.id
	end

end
