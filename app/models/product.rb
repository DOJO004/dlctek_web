class Product < ApplicationRecord
    validates :title, :descript, :amount, :price, presence: true
    validate :acceptable_image
    has_one_attached :main_image

    private

    def acceptable_image
        return unless main_image.attached?

        unless main_image.blob.byte_size <= 1.megabyte
            errors.add(:main_image, "Image needs to less 1mb")
        end

        acceptable_types = ["image/jpeg", "image/png"]
        unless acceptable_types.include?(main_image.content_type)
            errors.add(:main_image, "Image must be JPEG or PNG")
        end
    end
end
