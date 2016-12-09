class Album < ActiveRecord::Base
  belongs_to :band

  has_many :tracks,
  dependent: :destroy

  validates :name, :band_id, presence: true
end
