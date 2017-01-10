class Role < ActiveRecord::Base
    belongs_to :pornstar
    belongs_to :video
end
