# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ShopItem.destroy_all
{
    'juice'     => ['orange','apple','grape','cherry'],
    'icecream'  => ['coconut','guava','coffee']

}.each do |k,v|
  v.each do |item|
    file_path = Rails.root.join( 'lib', 'imgs', "#{item}.jpeg" )
    ShopItem.create item_type: k, name: item, img: File.open( file_path )
  end
end

ShopItem.create item_type: 'icecream', name: 'chocolate'
