class Article < ApplicationRecord
    belongs_to :user
    has_rich_text :content
    has_one_attached :cover_photo

    def self.ransackable_attributes(_auth_object = nil)
        %w[title category]
    end

    def self.ransackable_associations(_auth_object = nil)
        []
    end
end
