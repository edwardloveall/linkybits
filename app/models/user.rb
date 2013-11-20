class User < ActiveRecord::Base
  include Clearance::User

  has_many :links
  has_and_belongs_to_many :groups
end
