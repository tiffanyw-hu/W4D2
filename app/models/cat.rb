# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLOR = %w(black white brown orange grey)

  validates :color, inclusion: { in: COLOR }
  validates :sex, inclusion: { in: %w(M F) }

  has_many :requests,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest,
  dependent: :destroy

end
