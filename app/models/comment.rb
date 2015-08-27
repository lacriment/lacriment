class Comment < ActiveRecord::Base
  validates :email, presence: true, email_format: { message: 'bu e-posta adresi şimdi öyle mi? hm ok.' }
  validates :name, presence: true
  validates :body, presence: true, length: { minimum: 3 }

  belongs_to :article
end
