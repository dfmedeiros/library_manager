class BooksController < ApplicationController

  def index
    @books = if params[:search].present?
      Book.search_by_title_and_author(params[:search])
    else
      Book.all
    end
  end

end