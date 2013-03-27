class Book < ActiveRecord::Base
  attr_accessible :title, :author

  has_many :loans

  validates :title, :presence => true
  validates :author, :presence => true

  def self.search_by_title_and_author(params)
    self.where("title ilike ? and author ilike ?", "%#{params[:title]}%", "%#{params[:author]}%")
  end

  def available?
    self.loans.pending.empty?
  end
end
