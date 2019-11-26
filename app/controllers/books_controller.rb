class BooksController < ApplicationController

    before_action :find_book,only:[:show,:edit,:update,:destroy]    
    before_action :authenticate_user!,except:[:index, :show]

    def index
        @books = Book.available.with_attached_cover_image.page(params[:page]).per(4)
    end

    def new
        @book = Book.new   
    end
		
    
    def show
    
    end

  

    private
     def find_book
        @book = Book.find(params[:id])
    end
end
