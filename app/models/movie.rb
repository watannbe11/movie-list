class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
end
