class Corporate < ApplicationRecord
  belongs_to :user
  default_scope -> { order(updated_at: :desc)}
  validates :user_id, presence: true
  validates :corp_name, presence: true, length: { maximum: 50}
  validates :aspiration, presence: true
end
