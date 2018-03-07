# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
  validate :does_not_overlap_approved_request

  belongs_to :cat, foreign_key: :cat_id, class_name: :Cat


  def overlapping_requests
    CatRentalRequest.where("start_date between ? and ?", "#{self.start_date}", "#{self.end_date}")
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      errors[:overlapping_error] << "can't grab a cat with overlapping dates"
    end
  end

end
