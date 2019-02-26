class User < ApplicationRecord
  has_secure_password
  has_many :favorites
  validates_presence_of :email
  validates_uniqueness_of :email

  before_create :make_api_key

  def create_favorite(data)
    favorites.find_or_create_by(location: data[:location].downcase)
  end

  private

  def make_api_key
    self.api_key = SecureRandom.uuid
  end
end
