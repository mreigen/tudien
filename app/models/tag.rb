class Tag < ActiveRecord::Base
  belongs_to    :author
  belongs_to    :word
end