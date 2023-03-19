# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Task.create!(name: 'task1', description: 'description1', user_id: 3, board_id: 23)
Task.create!(name: 'task2', description: 'description2', user_id: 3, board_id: 23)
Task.create!(name: 'task3', description: 'description3', user_id: 4, board_id: 23)
Task.create!(name: 'task4', description: 'description4', user_id: 4, board_id: 25)