 
# Textil. co time checker
This application is designed to keep track of employee schedules of Textile Co.
In the admin panel you can :
- Set Departments 
- Set entry and departure times
- Manage employees list
- See who is coming later who has not shown up for work

## Installation
Clone the repo and type in your console bundle install
then
type in your console  rake db:seed 

## Panel admin
In your web browser visit http://localhost:3000/admins/sign_in
You can login with email admin@textil.co and password admin123

## Usage
This is  example using CURL 
curl -H "Content-Type: application/json" -d '{"clock": {"employee":5}}' -X POST http://localhost:3000/clocks.json -i
  