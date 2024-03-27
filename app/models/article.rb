class Article < ApplicationRecord
    belongs_to :user
    has_rich_text :content
    has_one_attached :cover_photo

    def self.ransackable_attributes(auth_object = nil)
        %w[title category]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end
end
