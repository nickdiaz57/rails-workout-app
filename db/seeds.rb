# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Workout.create(title: "Fran", content: "21-15-9 Thrusters, Pullups", date: DateTime.new(2021, 1, 1, 1))
Workout.create(title: "Diane", content: "21-15-9 Deadlifts, HSPU", date: DateTime.new(2021, 1, 2, 2))
Workout.create(title: "Leg Day", content: "Hatch Squat Week 2", date: DateTime.new(2021, 1, 3, 3))
Workout.create(title: "Arm Day", content: "Curls, Skullcrushers, Bench Press", date: DateTime.new(2021, 1, 4, 4))
Workout.create(title: "Cardio Day", content: "Run, Row, Bike", date: DateTime.new(2021, 1, 5, 5))