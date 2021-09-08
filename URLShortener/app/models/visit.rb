class Visit < ApplicationRecord

    validates :user_id, :short_url_id, uniqueness: true, presence: true

    belongs_to(
        :shortened_url,
        class_name: "ShortenedUrl",
        foreign_key: :short_url_id,
        primary_key: :id,
        optional: true
    )

    belongs_to(
        :visitor,
        class_name: "User",
        foreign_key: :user_id,
        primary_key: :id,
        optional: true

    )

    def self.record_visit!(user, shortened_url)
        Visit.create!(short_url_id: shortened_url.id, user_id: user.id)
    end

end
