class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in:['Fiction', 'Non-Fiction']}
    validate :title_is_clickbaity

    def title_is_clickbaity
        if title
        unless title.match?(/Won't Believe/ || /Secret/ || /Top/ || /Guess/)
            errors.add(:title, "Title isn't clickbait-y enough!")
        end
    end
end
end
