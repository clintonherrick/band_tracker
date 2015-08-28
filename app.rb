require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end


get('/venues') do
  @venues = Venue.all()
  erb(:venues)
end


get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

post('/bands') do
  name = params.fetch("band")
  Band.create({name: name})
  redirect("/bands")
end

post('/venues') do
  name = params.fetch("venues")
  Venue.create({:name => name})
  redirect('/venues')
end

get('/venue/:id') do
  @venue = Venue.find(params.fetch("id").to_i())
  erb(:venue)
end

post('/venue/:id') do
  @venue = Venue.find(params.fetch("id").to_i())
  band = params.fetch('band')
  @venue.bands.create({:name => band})
  redirect("/venue/#{@venue.id()}")
end

get('/band/:id') do
  @band = Band.find(params.fetch("id").to_i())
  erb(:band)
end


post('/band/:id') do
  @band = Band.find(params.fetch("id").to_i())
  venue = params.fetch('venue')
  @band.venues.create({:name => venue})
  redirect("/band/#{@band.id()}")
end

patch('/band/:id') do
  @band = Band.find(params.fetch("id").to_i())
  band = params.fetch('band')
  @band.update({:name => band})
  redirect back
end

patch('/venue/:id') do
  @venue = Venue.find(params.fetch('id').to_i())
  venue = params.fetch('venue')
  @venue.update({name: venue})
  redirect back
end

delete('/venues') do
  venue = Venue.find(params.fetch('venue_id').to_i())
  venue.destroy()
  @venues = Venue.all()
  redirect back
end

delete('/bands') do
  band = Band.find(params.fetch('band_id').to_i())
  band.destroy()
  @bands = Band.all()
  redirect back
end
