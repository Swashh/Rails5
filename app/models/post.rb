class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, as: :item, dependent: :destroy

  validates_format_of :title, :text, :with => /\A[a-zA-Z\.]{2,}+( [a-zA-Z\.]{2,}+)+\Z/,
                      message: 'Начало должно быть с большой буквы, только текст, минимум 2 слова , минимум по 2 символа, принимаеться точка'
  validates_each :title, :text do |record, attr, value|
    record.errors.add(attr, 'должен начинаться с большой буквы') if value =~ /\A[[:lower:]]/
  end
end
