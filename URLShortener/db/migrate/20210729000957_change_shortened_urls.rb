class ChangeShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    remove_column :shortened_urls, :unique
  end
end
