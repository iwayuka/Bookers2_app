class BooksController < ApplicationController

  def new
  end

  def create
  end

  def index
    @books = Book.all
    @book = Book.new

  end

  def show
  end

  def edit
  end

  def destroy
  end

end
