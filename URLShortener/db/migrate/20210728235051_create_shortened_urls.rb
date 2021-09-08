class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|

      t.string :long_url, :unique
      t.string :short_url, :unique

      t.integer :user_id

    end

    add_index :shortened_urls, :user_id
  end
end
