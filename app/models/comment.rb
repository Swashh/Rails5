class Comment < ApplicationRecord
  belongs_to :item, polymorphic: true

  validates_format_of :title, :with => /\A[a-zA-Z\.]{2,}+( [a-zA-Z\.]{2,}+)+\Z/
  # validates_format_of :title, :text  do |record, attr, value|
  #   record.errors.add(attr,'Должно начинаться с большой буквы') if value =~ /\A[[:lower:]]/
  validates :text, presence: true
end
