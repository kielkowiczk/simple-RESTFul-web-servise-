require 'test_helper'

class BooksTest < ActiveSupport::TestCase
  test 'book model' do

    book = Book.new
    assert !book.save, 'saved book w/o title, author or description!'
    
    book = Book.new :title=> "", :author => "", :description => ""
    assert !book.save, 'saved book w/ empty title or autor or description!' 

    book = Book.new :title => "sample", :author =>"123", :description => "sample"
    assert !book.save, 'saved book with not alphabetic title'
    
    book = Book.new :title => "sample", :author =>"124", :description => "sample", :rating => ""
    assert !book.save, 'saved w/o rating'

    book = Book.new :title => "sample", :author =>"123", :description => "sample", :rating => "a"
    assert !book.save, 'saved with non numeric value of rating'

    book = Book.new :title => "sample", :author =>"first last", :description => "sample", :rating => "5"
    assert book.save, 'did not save correct book'
 
  end
end
