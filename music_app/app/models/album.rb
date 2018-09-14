# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  year       :integer          not null
#  live       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :title, :band_id, :year, presence: true
  validates_inclusion_of :year, in: 1951..Time.current.year

  belongs_to :band,
    foreign_key: :band_id,
    class_name: :Band
end
