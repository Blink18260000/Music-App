class Band < ActiveRecord::Base
  validates :band_name, presence: true
  before_save :fix_name

  has_many :albums,
    dependent: :destroy

  has_many :tracks,
    through: :albums,
    source: :tracks

  def fix_name
    self.band_name = self.band_name.titleize
  end
end
