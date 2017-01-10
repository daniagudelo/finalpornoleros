class Pornstar < ActiveRecord::Base
    has_many :roles
    has_many :videos, through: :roles
end
