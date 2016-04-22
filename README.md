 
# Textil. co time checker
This application is designed to keep track of employee schedules of Textile Co.
In the admin panel you can :
- Set Departments 
- Set entry and departure times
- Manage employees list
- See who is coming later who has not shown up for work

## Installation
Clone the repo and type in your console bundle install
## Usage
This is  example using CURL 
curl -H "Content-Type: application/json" -d '{"clock": {"employee":5}}' -X POST http://localhost:3000/clocks.json -i
  