class User < ActiveRecord::Base
  has_many :posts
end

class Post < ActiveRecord::Base
  belongs_to :user
end

class Follow < ActiveRecord::Base
  belongs_to :user
end