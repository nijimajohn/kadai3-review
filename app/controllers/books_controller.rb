class BooksController < ApplicationController
  
  def create
    @books = Book.all
    @book=Book.new(book_params)
    @book.user_id= current_user.id
   if @book.save
     redirect_to book_path(@book.id),notice: "You have created book successfully."
   else
       @user = current_user
       render :index
   end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @book = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end
  
  def update
    book = book.find(params[:id])
    book.update(blog_params)
    redirect_to books_path
  end
  
  
  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
end


