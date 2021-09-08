require 'securerandom'

class ShortenedUrl < ApplicationRecord

    validates :short_url, :long_url,  presence: true

    belongs_to(
        :submitter,
        class_name: "User",
        foreign_key: :user_id,
        primary_key: :id,
        optional: true

    )

    has_many(
        :visits,
        primary_key: :id,
        foreign_key: :short_url_id,
        class_name: "Visit",
        dependent: :destroy
    )

    has_many :visitors, through: :visits, source: :visitor

    def self.random_code
        code= SecureRandom.urlsafe_base64

        while ShortenedUrl.exists?(short_url: code) == true
            code= SecureRandom.urlsafe_base64
        end

        code
    end

    def self.new!(user_obj, long_url)
        ShortenedUrl.create!(user_id: user_obj.id,
            long_url: long_url,
            short_url: self.random_code)
    end

    def num_clicks
        self.visits.count
    end

    def num_uniques
        visits.select('user_id').distinct.count
    end

    def num_recent_uniques
        visits
        .select('user_id')
        .where('created_at > ?', 10.minutes.ago)
        .distinct
        .count
    end


end
