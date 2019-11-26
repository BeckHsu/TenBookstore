class Admin::BooksController < ApplicationController
    before_action :authenticate_user!
    layout 'backend'
    before_action :find_book,only:[:show,:edit,:update,:destroy]    

     def index
        # @books = Book.where(on_sell:true).with_attached_cover_image
        @books = Book.available.with_attached_cover_image.page(params[:page]).per(4)
    end

    def new
        @book = Book.new   
    end
		
    def edit
    end

    def create
        @book = Book.new(book_params)

        if @book.save
            # redirect_to root_path,notice: '新增成功'
            redirect_to admin_books_path,notice: '新增成功'
        else
            render :new   # 借用 new.html.erb
        end
    end

    def update
        if @book.update(book_params)
        redirect_to edit_admin_book_path(@book), notice: '更新成功'
        else
        render :edit
        end
    end
    def destroy
        # find_book
        @book.destroy
        redirect_to admin_books_path , notice: '刪除成功'
    end

    def show
        # find_book
    end

    def find_book
        @book = Book.find(params[:id])
    end

    private
    def book_params
        #strong parameters
        params.require(:book).permit(:title,:description,:list_price,:sell_price,:page_num,:isbn,:isbn13,:cover_image,:on_sell,:published_at,:publisher_id)
    end
end
