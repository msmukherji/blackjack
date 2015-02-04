require 'pry'
require 'set'

class Card

	def initialize card_val, suit
		@card_val = card_val
		@suit = suit
	end

	def value
		if [:K, :Q, :J].include? @card_val
			return 10
		elsif :A == @card_val
			return 1
		else
			return @card_val
		end
	end

	def to_string
		arr_card = [@card_val.to_s, @suit.to_s]
		str_card = arr_card.join("")
		# {@card_val} #{@suit}
		return str_card
	end

end


class Deck

	def initialize
		@list_of_cards = []
		values = [2,3,4,5,6,7,8,9,10,:K,:Q,:J,:A]
		suits = [:S,:H,:D,:C]

		suits.each do |suit|
			values.each do |val|
				@list_of_cards.push [val, suit]
			end
		end
		return @list_of_cards
	end

	def cards
		@list_of_cards
	end

	def drawn
		@drawn
	end

	def draw
		@drawn = cards.shift
		return @drawn.first
	end

end

class Hand

	def initialize 
		@running_hand = []
	end

	def running_hand
		@running_hand
	end

	def add (*args)
		args.each do |card|
			@running_hand.push card
		end
		return @running_hand
	end

	def sum
		@running_hand.inject(0) {|sum, card| sum += card.value} 
	end

	def value
		sigma = sum
		@running_hand.each do |card| 
			if card.value == 1 && sigma + 10 <= 21
				sigma += 10
			end
		end
		return sigma
		
	end

	def busted?
		score = value
		score > 21
	end

	def blackjack?
		score = value
		score == 21
	end

	def to_s
		string_hand = @running_hand.map {|card| card.to_string}.join(", ")
	end

end
