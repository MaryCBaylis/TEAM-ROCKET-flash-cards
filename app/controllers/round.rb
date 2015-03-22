get '/decks' do 
  puts "[LOG] responding to a GET request for /decks"
  @decks = Deck.all
  erb :decks
end

get '/round/:deck_id' do 
  puts "[LOG] responding to a GET request for /round/deck_id"
  @deck = Deck.find(params[:deck_id])
  erb :round
end 