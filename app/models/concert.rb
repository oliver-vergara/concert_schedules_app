class Concert < ActiveRecord::Base
  validates :artist, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
