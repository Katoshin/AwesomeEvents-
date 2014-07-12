class Check < ActiveRecord::Base
  belongs_to :user
  belongs_to :music

	validates :comment, length: { maximum: 30 }, allow_blank: true
end
