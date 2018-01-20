# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Ticket.delete_all
Ticket.create! id: 1_1, name: "row 1 seat 1", price: 40, active: true
Ticket.create! id: 1_2, name: "row 1 seat 2", price: 40, active: true
Ticket.create! id: 1_3, name: "row 1 seat 3", price: 40, active: true
Ticket.create! id: 1_4, name: "row 1 seat 4", price: 40, active: true
Ticket.create! id: 1_5, name: "row 1 seat 5", price: 40, active: true
Ticket.create! id: 2_1, name: "row 2 seat 1", price: 30, active: true
Ticket.create! id: 2_2, name: "row 2 seat 2", price: 30, active: true
Ticket.create! id: 2_3, name: "row 2 seat 3", price: 30, active: true
Ticket.create! id: 2_4, name: "row 2 seat 4", price: 30, active: true
Ticket.create! id: 2_5, name: "row 2 seat 5", price: 30, active: true
Ticket.create! id: 3_1, name: "row 3 seat 1", price: 20, active: true
Ticket.create! id: 3_2, name: "row 3 seat 2", price: 20, active: true
Ticket.create! id: 3_3, name: "row 3 seat 3", price: 20, active: true
Ticket.create! id: 3_4, name: "row 3 seat 4", price: 20, active: true
Ticket.create! id: 3_5, name: "row 3 seat 5", price: 20, active: true


#OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"