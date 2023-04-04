class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: :true, length: { minimum: 6, maximum: 50 }
  validates :content, presence: :true
end
