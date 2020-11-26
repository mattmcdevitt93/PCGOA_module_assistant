class Wand < ApplicationRecord

	def self.generate_description()
		data = [rand(1..10), rand(1..10), rand(1..5), rand(1..10), rand(1..10), rand(1..10)]
		output = "A "
		if data[0] == 1
			output = output + "Short "
		elsif data[0] == 2
			output = output + "Long "
		elsif data[0] == 3
			output = output + "Curved "
		elsif data[0] == 4
			output = output + "Stubby "
		elsif data[0] == 5
			output = output + "Splintered "
		elsif data[0] == 6
			output = output + "Rough "
		elsif data[0] == 7
			output = output + "Smooth "
		elsif data[0] == 8
			output = output + "Bent "
		elsif data[0] == 9
			output = output + "Carved "
		elsif data[0] == 10
			output = output + "Stout "
		end

		if data[1] == 1
			output = output + "Oak"
		elsif data[1] == 2
			output = output + "Birch"
		elsif data[1] == 3
			output = output + "Willow"
		elsif data[1] == 4
			output = output + "Beech"
		elsif data[1] == 5
			output = output + "RedWood"
		elsif data[1] == 6
			output = output + "Ash"
		elsif data[1] == 7
			output = output + "Elm"
		elsif data[1] == 8
			output = output + "Fir"
		elsif data[1] == 9
			output = output + "Hickory"
		elsif data[1] == 10
			output = output + "Maple"
		elsif data[1] == 11
			output = output + "Pine"
		elsif data[1] == 12
			output = output + "Spruce"
		end

		output = output + " wand with "

		if data[2] == 1
			output = output + "an inscription \"" + BetterLorem.w(rand(2..5), true, true ) + "\""
		elsif data[2] == 2
			output = output + "a small carving of a "
			drawing = rand(1..5)
			if drawing == 1
				output = output + "dog"
			elsif drawing == 2
				output = output + "wolf"
			elsif drawing == 3
				output = output + "bear"
			elsif drawing == 4
				output = output + "bird"
			elsif drawing == 5
				output = output + "dong..."
			end
		elsif data[2] == 3
			output = output + "someone’s initials \"" + BetterLorem.c(rand(1..3), true ) + "\""
		elsif data[2] == 4
			output = output + "a lacquered handle"
		elsif data[2] == 5
			output = output + "a "

			metal = rand(1..5)
				if metal == 1
					output = output + "gold"
				elsif metal == 2
					output = output + "brass"
				elsif metal == 3
					output = output + "iron"
				elsif metal == 4
					output = output + "silver"
				elsif metal == 5
					output = output + "copper"
				end
			type = rand(1..2)
				if type == 1
					output = output + " band"
				elsif type == 2
					output = output + " cap"
				end
		end

			return output
		end

	end
