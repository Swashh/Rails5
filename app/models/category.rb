class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, as: :item, dependent: :destroy

  validates_format_of :title, :text, :with => /\A[a-zA-Z\.]{2,}+( [a-zA-Z\.]{2,}+)+\Z/
  validates_each :title, :text do |record, attr, value|
    record.errors.add(attr, 'Должно начинаться с большой буквы') if value =~ /\A[[:lower:]]/
  end
end

