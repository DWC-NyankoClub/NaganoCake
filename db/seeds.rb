# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@gmail.com',
  password: '000000',
)

10.times do |n|
  Customer.create!(
    first_name: "太郎#{n}",
    last_name: "てすと",
    first_name_kana: "タロウ",
    last_name_kana: "テスト",
    postcode: "000#{n}",
    address: "テストデータ住所#{n}",
    telephone_number: "0800000#{n}",
    email: "user#{n}@test.com",
    password: "000000"
  )
end

Customer.all.each do |customer|
  rand(0..3).times do |n|
    Address.create!(
      customer_id: customer.id,
      name: "#{customer.last_name}#{customer.first_name}の住所#{n}",
      address: "#{customer.address}-#{n}",
      postcode: "0000#{customer.id}#{n}"
    )
  end
end

5.times do |n|
  Genre.create!(
    name: "テストジャンル#{n}"
  )
end

Genre.all.each do |genre|
  rand(0..5).times do |n|
    Item.create!(
      genre_id: genre.id,
      name: "テスト商品#{genre.id}-#{n}",
      description: "テスト商品#{genre.id}-#{n}の説明",
      price: 100*rand(1..20),
      image: File.open("#{Rails.root}/app/assets/images/test_image.png")
    )
  end
end

Customer.all.each do |customer|
  rand(0..3).times do
    items = Item.all.sample(rand(1..5))
    total_price = 0
    order_items = []
    items.each do |item|
      order_item = OrderItem.new(
        item_id: item.id,
        quantity: rand(1..5),
        price: item.price
      )
      total_price += order_item.quantity * order_item.price
      order_items.push(order_item)
    end

    total_price += 800

    order = Order.create!(
      customer_id: customer.id,
      shipping_cost: 800,
      total_price: total_price,
      pay_type: rand(0..1),
      name: customer.last_name+customer.first_name,
      address: customer.address,
      postcode: customer.postcode
    )

    order_items.each do |order_item|
      order_item.order_id = order.id
      order_item.save
    end
  end
end