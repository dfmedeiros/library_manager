require 'spec_helper'

describe Book do

  context "on search" do
    before do
      @book1 = create(:book)
      @book2 = create(:book)
      @books_by_author = Book.search_by_title_and_author({:author => @book2.author})
      @books_by_title = Book.search_by_title_and_author({:title => @book1.title})
    end

    it "should return correct books when searching by author" do
      @books_by_author.should include @book2
      @books_by_author.should_not include @book1
    end

    it "should return correct books when searching by title" do
      @books_by_title.should include @book1
      @books_by_title.should_not include @book2
    end
  end

  context "on borrowing a book" do
    before do
      @book = create(:book)
      @loan = create(:loan, book: @book)
    end

    it "should set book as unavailable" do
      @book.reload.should_not be_available
    end
  end

  context "on replacing a book" do
    before do
      @book = create(:book)
      @loan = create(:loan, book: @book)
      @loan.replace!
    end

    it "should set book as available" do
      @book.reload.should be_available
    end
  end

end