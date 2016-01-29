class Track < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :album_id, message: "Album already has an album with this title" }
  before_save :fix_name

  belongs_to :album

  def fix_name
    self.title = self.title.titleize
  end
end
