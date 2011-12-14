class Book < ActiveRecord::Base
  validates :author, :title, :description, :rating, :presence => true
  validates :author, :format => { :with => /^[a-zA-Z]*\s[a-zA-Z]*/}
  validates :rating, :format => { :with => /\d/ }
end
