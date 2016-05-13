json.id concert.id
json.Artist concert.artist
json.Genre concert.genre
json.Scheduled Date concert.concert_date
json.City concert.email
json.ssn concert.ssn
json.human_created_at concert.created_at.strftime("%m/%d/%Y")
json.addresses concert.addresses do |address|
  json.line_1 address.address_1
  json.line_2 address.address_2
  json.city address.city
  json.state address.state
  json.zip address.zip
end