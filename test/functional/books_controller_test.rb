require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test 'index' do
    get :index, :format => [:json]
    assert_response :success
  end
  
  test 'show' do
    get :show, :id => 1, :format => [:json]
    assert_response :success
    assert_not_nil assigns(:book)
  end

  test 'create' do
    assert_difference('Book.all.count') {
      post :create, :book => {:title=>"some title", :author => "some author", :description => "some funky description", :rating => 3}, :format => [:json]
    }
  #assert_redirected_to({:controller => "books", :method => "show"}) 
  assert_response :created
  end
  
  test 'new' do
    get :new, :format => [:json]
    
    assert_not_nil assigns[:book]
    assert_response :success
  end

  test 'edit' do
    get :edit, :format => [:json], :id => Book.first
    
    assert assigns[:msg]
    assert assigns[:msg] == "Nothing to do"
    assert_response :success
  end

  test 'update' do
    book = Book.first
    put :update, :id => book.id, :book => {:author => 'New Author', :title => 'New title', :description => "New description"}, :format => [:json] 
    book_changed = Book.first
    assert_not_same book, book_changed
    assert_response :ok
  end

  test 'respond destroy' do
    assert_difference('Book.all.count', -1) {
      delete :destroy, :id => 1, :format => [:json]
      assert_response :ok
    }
    assert_raise(ActiveRecord::RecordNotFound) {
      get :show, :id => 1, :format => [:json]
    }
  end
  
  test 'should route to book controller and point to best action' do
    assert_routing 'books/best', {:controller => "books", :action => "best"}
  end
  
  test 'best action' do
    get :best, :format => [:json]
  
    assert_response :success
    assert_not_nil assigns[:bests]
    assert_kind_of ActiveRecord::Relation, assigns[:bests]
  end
end
