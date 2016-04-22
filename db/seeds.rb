moments = Moment.create([{name:'Arrival time'},{name:'Lunch start'},{name:"Lunch end"},{name:"Depart Time"}])
admin = Admin.create!  :email => 'admin@textil.co', :password => 'admin123', :password_confirmation => 'admin123'
