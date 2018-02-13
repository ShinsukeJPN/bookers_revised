class Review < ApplicationRecord
	validates :title, presence: true
	validates :review, presence: true
end