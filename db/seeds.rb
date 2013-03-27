Employee.destroy_all
Employee.create(:full_name => 'Demo Employee', :registration => 'ABC123456', :email => 'demo@example.com', :password => '123456', :password_confirmation => '123456')

Student.destroy_all
Book.destroy_all

10.times do |n|
  Student.create(:full_name => "Student #{n}", :registration => "ABC00000#{n}")
  Book.create(:title => "Book #{n}", :author => "Author #{n}")
end

