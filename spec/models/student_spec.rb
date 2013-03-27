require 'spec_helper'

describe Student do

  context "on search" do
    before do
      @student1 = create(:student)
      @student2 = create(:student)
      @students_by_full_name = Student.search_by_full_name_and_registration({:full_name => @student2.full_name})
      @students_by_registration = Student.search_by_full_name_and_registration({:registration => @student1.registration})
    end

    it "should return correct students when searching by full name" do
      @students_by_full_name.should include @student2
      @students_by_full_name.should_not include @student1
    end

    it "should return correct students when searching by registration" do
      @students_by_registration.should include @student1
      @students_by_registration.should_not include @student2
    end
  end

  context "on creating loan" do
    before do
      @loan = create(:loan)
      @student = @loan.student
    end

    it "should set pending loans to true on student" do
      @student.reload.should be_has_pending_loans
    end
  end

  context "on replacing loan" do
    before do
      @loan = create(:loan)
      @loan.replace!
      @student = @loan.student
    end

    it "should set pending loans to false on student" do
      @student.reload.should_not be_has_pending_loans
    end
  end
  
end