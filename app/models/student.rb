class Student < ActiveRecord::Base
  attr_accessible :full_name, :registration

  has_many :loans

  def self.search_by_full_name_and_registration(params)
    self.where("full_name ilike ? and registration ilike ?", "%#{params[:full_name]}%", "%#{params[:registration]}%")
  end

  def has_pending_loans?
    self.loans.pending.count > 0
  end
end
