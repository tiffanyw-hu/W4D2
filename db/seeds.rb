# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
CatRentalRequest.destroy_all

cat1 = Cat.create(name: Faker::Cat.name, birth_date: Faker::Date.birthday(0, 25), color: 'black', sex: 'M', description: 'first cat')
cat2 = Cat.create(name: Faker::Cat.name, birth_date: Faker::Date.birthday(0, 25), color: 'white', sex: 'F', description: 'second cat')
cat3 = Cat.create(name: Faker::Cat.name, birth_date: Faker::Date.birthday(0, 25), color: 'brown', sex: 'F', description: 'third cat')
cat4 = Cat.create(name: Faker::Cat.name, birth_date: Faker::Date.birthday(0, 25), color: 'orange', sex: 'F', description: 'A good cat')


request1 = CatRentalRequest.create(cat_id: cat1.id, start_date: '2017-02-25', end_date: '2017-02-27', status: 'APPROVED')
request2 = CatRentalRequest.create(cat_id: cat1.id, start_date: '2017-02-26', end_date: '2017-02-28', status: 'PENDING')

# request4 = CatRentalRequest.create(cat_id: cat1.id, start_date: '2017-02-25', end_date: '2017-02-27', status: 'APPROVED')
