require_relative 'ui'

def masked_word(kicks, secret_word)
		mask = ""
		for letter in secret_word.chars
				if kicks.include? letter
						mask << letter
				else
						mask << "_"
				end
		end
		mask
end

def ask_valid_kick(kicks, errors, mask)
		header_of_kicks kicks, errors, mask
		loop do
				kick = ask_a_kick
				if kicks.include? kick
						warn_kick_effected kick
				else
						return kick
				end
		end
end

def play(name)
	secret_word = choice_secret_word

	errors = 0
	kicks = []
	points_at_now = 0

	while errors < 5
			mask = masked_word kicks, secret_word
			kick = ask_valid_kick kicks, errors, mask
			kicks << kick
		
			kick_a_letter = kick.size == 1
			if kick_a_letter
					letter_wanted = kick[0]
					total_searched = secret_word.count letter_wanted
					if total_searched == 0
							warn_letter_not_found
							errors += 1
					else
							warn_letter_found total_searched
					end
			else
					hit = kick == secret_word
					if hit
							warn_hit_word
							points_at_now += 100
							break
					else
							warn_missed_word
							points_at_now -= 30
							errors += 1
					end
			end

	end

	warn_points points_at_now

end

def fork_game
		name = say_welcome

		loop do
				play name
				if dont_want_play?
						break
				end
		end
end