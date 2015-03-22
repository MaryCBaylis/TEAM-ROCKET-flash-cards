get '/decks' do
  puts "[LOG] responding to a GET request for /decks"
  @decks = Deck.all
  erb :decks
end

# starts a round, asks for a guess
get '/round/:deck_id' do
  @front = true
  puts "[LOG] responding to a GET request for /round/deck_id"

  @deck = Deck.find(params[:deck_id])
  @round = Round.find_or_create_by(deck_id: @deck.id, user_id: session[:id])
  @round.deck_order = @deck.deck_shuffle.map { |card| card.id }.join(",")
  @round.save

  @current_index = @round.current_card_index || 0
  current_card(@current_index)

  erb :round
end

# checks entered guess right/wrong
post '/round/:deck_id/:index' do
  puts "[LOG] responding to a POST request for /round/deck_id/index"

  @front = false
  current_round

  @current_index = params[:index].to_i
  current_card(@current_index)
  @current_card.correct = @current_card.answer == params[:guess]
  @current_card.save

  erb :round
end

get '/round/:deck_id/finish' do
  current_round

  erb :endgame
end


# clicks on next, goes to next card
get '/round/:deck_id/:index' do
  @front = true
  current_round

  @current_index = params[:index].to_i + 1
  @round.current_card_index = @current_index
  if @current_index <= @deck.cards.size - 1
    current_card(@current_index)
  else
    redirect "/round/#{@deck.id}/finish"
  end
  erb :round
end



def current_round
  @deck = Deck.find(params[:deck_id])
  @round = Round.where(deck_id: @deck.id, user_id: session[:id]).first
end

def current_card(index)
  @current_card = Card.find(@round.deck_order.split(",")[@current_index])
end