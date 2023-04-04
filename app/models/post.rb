class Post < ApplicationRecord
  belongs_to :user

  URL_REGEX = /\A(https?:\/\/)?((www\.)?youtube\.com|youtu\.be)\/.+\z/i.freeze
  validates :title, presence: :true, length: { minimum: 6, maximum: 50 }
  validates :content, presence: :true, format: { with: URL_REGEX }
end
