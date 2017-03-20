class Comment < ActiveRecord::Base
  include Bootsy::Container
  belongs_to :post
  
end
