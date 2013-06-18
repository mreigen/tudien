class Definition < ActiveRecord::Base
  belongs_to  :author
  belongs_to  :word
end