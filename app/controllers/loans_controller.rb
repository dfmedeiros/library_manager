# encoding: utf-8

class LoansController < ApplicationController

  def index
    @book = Book.find(params[:book_id])
    @loans = @book.loans
  end

  def new
    @book = Book.find(params[:book_id])
    if @book.available?
      @loan = @book.loans.new(:employee_id => current_employee.id)
    else
      redirect_to books_path, :alert => I18n.t('loan.book_unavailable')
    end
  end

  def create
    @loan = Loan.new(params[:loan])
    if @loan.save
      redirect_to books_path, :notice => I18n.t('loan.succesfully_created')
    else
      @book = Book.find(params[:book_id])
      render :new
    end
  end

  def replace
    @loan = Loan.find(params[:id])
    @loan.replace!
    redirect_to books_path, :notice => I18n.t('loan.succesfully_replaced')
  end

end