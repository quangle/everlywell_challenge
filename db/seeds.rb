# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

quang = User.create(name: 'quang le', website_url: 'https://www.aplaceformom.com/assisted-living/texas/austin')
john = User.create(name: 'john doe', website_url: 'https://www.aplaceformom.com/assisted-living/texas/houston')
jack = User.create(name: 'jack frost', website_url: 'https://www.aplaceformom.com/assisted-living/texas/dallas')
jane = User.create(name: 'jane doe', website_url: 'https://www.aplaceformom.com/assisted-living/texas/waco')

quang.friends << john
jack.friends << quang
jane.friends << jack

