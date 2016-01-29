class Album < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :band_id, message: "Band already has an album with this title" }
  before_save :fix_name

  belongs_to :band

  has_many :tracks,
    dependent: :destroy

  def fix_name
    self.title = self.title.titleize
  end
end
