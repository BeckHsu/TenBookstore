class Admin::PublishersController < ApplicationController
    before_action :authenticate_user!
    layout 'backend'
    before_action :find_publisher,only:[:edit,:update,:destroy]    

     def index
        # @books = Book.where(on_sell:true).with_attached_cover_image
        @publishers = Publisher.available
    end

    def new
        @publisher = Publisher.new   
    end
		
    def edit
    end

    def create
        @publisher = Publisher.new(publisher_params)

        if @publisher.save
            # redirect_to root_path,notice: '新增成功'
            redirect_to admin_publishers_path,notice: '新增出版社成功'
        else
            render :new   # 借用 new.html.erb
        end
    end

    def update
        if @publisher.update(publisher_params)
        redirect_to edit_admin_publisher_path(@publisher), notice: '更新出版社成功'
        else
        render :edit
        end
    end
    def destroy
        # find_book
        @publisher.destroy
        redirect_to admin_publishers_path , notice: '刪除出版社成功'
    end

    def find_publisher
        @publisher = Publisher.find(params[:id])
    end

    private
    def publisher_params
        #strong parameters
        params.require(:publisher).permit(:name,:tel,:address,:note,:online)
    end
end
