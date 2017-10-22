class Message < ApplicationRecord
    has_one :receiver
    belongs_to :user
end
