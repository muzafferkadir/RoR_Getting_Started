class Article < ApplicationRecord
	  
	  has_many :comments, dependent: :destroy
	  validates :title, presence: true,length: { minimum: 5 }
	  validates :text, presence: true,length: { minimum: 5 }

	  scope :active, -> {where.not(title: "Ruby on Rails")}

	  def date#console test
	  	"#{created_at} tarihinde oluşturuldu."
	  end

end
