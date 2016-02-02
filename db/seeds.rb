# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.create name: 'Ironhack', description: 'it is a coding school'
Project.create name: 'time tracking app'
Project.create name: 'Recipes', description: 'I want to cook'
Project.create name: 'Greetings', description: 'Saying hello in different languages'
Project.create name: 'Shoes'
Project.create name: 'Shopping', description: 'I like to shop'
Project.create name: 'Airlines'
Project.create name: 'Sports', description: 'Watch your favorite sports.'

Entry.create project_id: 1, hours: 1, minutes: 4
Entry.create project_id: 2, hours: 0, minutes: 5
Entry.create project_id: 3, hours: 3, minutes: 34