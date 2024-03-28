class Product < ApplicationRecord
    validates :title, :descript, :amount, :price, presence: true
    validate :acceptable_image
    has_many_attached :images

    private

    def acceptable_image
        return unless images.attached?

        images.each do |image|
            if image.byte_size > 1.megabyte
                errors.add(:images, "Image #{image.filename} needs to be less than 1MB")
            end

            unless ["image/jpeg", "image/png"].include?(image.content_type)
                errors.add(:images, "Image #{image.filename} must be JPEG or PNG")
            end
        end
    end
end
