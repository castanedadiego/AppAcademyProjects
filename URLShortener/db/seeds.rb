# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
    u1 = User.create!(email: 'cwhite@gmail.com')
    u2 = User.create!(email: 'bwarford@gmail.com')

    su1 = ShortenedUrl.new!(
      u1, 'www.google.com'
    )

    su2 = ShortenedUrl.new!(
      u2, 'www.google2.com'
    )

    su3 = ShortenedUrl.new!(
      u2, 'www.imdb.com'
    )

  end
