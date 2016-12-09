class Track < ActiveRecord::Base
  belongs_to :album

  validates :name, :album_id, presence: true
end
