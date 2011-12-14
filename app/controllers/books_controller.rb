class BooksController < ApplicationController
  def index
    debugger
    books = Book.all
    respond_to do |format|
      format.xml { render :xml => books}
      format.json { render :json => books}
    end
  end
  
  def show
    @book = Book.find params[:id]

    respond_to do |format|
      format.json {render :json => @book}
    end 
  end
  
  def new 
    @book = Book.new
    respond_to do |format|
      format.json { render :json => @book }
    end
  end  
  
  def edit 
    @msg = "Nothing to do"
    respond_to do |format|
      format.json { render :json => @msg}
    end    
  end

  def create
    book = Book.new params[:book]
    if book.save then
      respond_to do |format|
        format.json { render :json => book, :status => :created, :location => book}
      end
    else 
      respond_to do |format|
        format.json { render :json => book.errors, :status => :unprocessable_entity}
      end
    end
  end

  def update
    book = Book.find params[:id]

    respond_to do |format|
      if book.update_attributes params[:book] then
        format.json { head :ok }
      else
        format.json { render :json => book.errors, :status => :unprocessable_entity}
      end
    end
  end

  def destroy
    book = Book.find params[:id]
    book.destroy

    respond_to do |format|
      format.json { head :ok }
    end
  end
  
  def best
    @bests = Book.order('rating desc').limit(2)

    respond_to do |f|
      f.json { render :json => @bests }
    end
  end
end
