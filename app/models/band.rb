class Band < ActiveRecord::Base
  has_many :albums,
  dependent: :destroy

  has_many :tracks,
  through: :albums,
  source: :tracks,
  dependent: :destroy

  validates :name, presence: true, uniqueness: true


end
