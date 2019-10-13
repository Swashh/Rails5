class Comment < ApplicationRecord
  belongs_to :item, polymorphic: true
end
