# == Schema Information
#
# Table name: profiles
#
#  id                  :integer          not null, primary key
#  name                :string
#  last_name           :string
#  user_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Profile < ApplicationRecord
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png" #OJO
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  belongs_to :user
	has_one :comment
  accepts_nested_attributes_for(:comment, update_only: true)
end
