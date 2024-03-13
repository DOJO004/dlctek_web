class Article < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  def self.ransackable_attributes(auth_object = nil)
    ["title", "category"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
  
end
