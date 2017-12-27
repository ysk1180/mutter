class Mutter < ApplicationRecord
    validates :content, presence: true
    validates :content, length: { maximum: 140 }

    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    belongs_to :user, optional: true
end
