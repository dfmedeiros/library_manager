require 'spec_helper'

describe Loan do

  context "on creation" do
    before do
      @loan1 = create(:loan)
      @loan2 = create(:loan)
      @loan3 = create(:loan)
      @loan4 = create(:loan)
      @loan1.end_at = Time.now + 8.days
      @loan2.end_at = nil
      @loan3.end_at = Time.now - 2.days
      @loan4.student = @loan3.student
    end

    it "should not be valid if end date is greater than start date by 7 days or more" do
      @loan1.should_not be_valid
    end

    it "should not be valid if end date is nil" do
      @loan2.should_not be_valid
    end

    it "should not be valid if end date is a past date" do
      @loan3.should_not be_valid
    end

    it "should set returned as false" do
      @loan1.should_not be_returned
    end

    it "should set returned_at as nil" do
      @loan1.returned_at.should be_nil
    end

    it "should not allow students to borrow other books with pending loans" do
      @loan4.should_not be_valid
    end
  end

  context "on replacing a loan" do
    before do
      @loan = create(:loan)
      @loan.replace!
    end

    it "should set loan as returned" do
      @loan.reload.should be_returned
    end

    it "should set returned_at" do
      @loan.reload.returned_at.should_not be_nil
    end
  end
 
  
end