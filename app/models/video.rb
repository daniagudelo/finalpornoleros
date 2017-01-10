class Video < ActiveRecord::Base
    has_many :roles
    has_many :pornstar, through: :roles
    has_many :categorizations
    has_many :categories, through: :categorizations
end
