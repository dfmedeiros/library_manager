# encoding: UTF-8
class Loan < ActiveRecord::Base
  attr_accessible :returned, :employee_id, :student_id, :book_id, :end_at

  belongs_to :book
  belongs_to :student
  belongs_to :employee

  scope :pending, where(:returned => false)

  validates :end_at, :presence => true
  validates :student_id, :presence => true
  validates :book_id, :presence => true
  validate :end_date_must_be_valid, :if => lambda {|loan| loan.end_at.present?}
  validate :student_cant_borrow_with_pending_loans, :if => lambda {|loan| !loan.returned_changed? && loan.student.present?}

  delegate :full_name, :to => :student
  delegate :title, :to => :book

  def replace!
    self.returned_at = Time.now
    self.returned = true
    self.save
  end

  private

  def end_date_must_be_valid
    errors.add(:end_at, I18n.t('loan.must_be_a_date_after_today')) if self.end_at < Time.now
    errors.add(:end_at, I18n.t('loan.must_be_inferior_to_seven_days')) if self.end_at - Time.now > 7.days
  end

  def student_cant_borrow_with_pending_loans
    errors.add(:student_id, I18n.t('loan.student_cant_borrow_with_pending_loans')) if self.student.has_pending_loans?
  end
end
