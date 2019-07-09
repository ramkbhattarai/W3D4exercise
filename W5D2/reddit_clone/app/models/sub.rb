class Sub < ApplicationRecord
  validates :title, :description, :user_id, presence: true

  belongs_to :user,
  foreign_key: :user_id,
  class_name: :User

  has_many :posts,
  foreign_key: :sub_id,
  class_name: :Post

   has_many :posts_subs,
  foreign_key: :sub_id,
  class_name: :PostSub
end
