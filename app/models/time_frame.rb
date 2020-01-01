class TimeFrame < ApplicationRecord
	def self.two_weeks
		find_or_create_by(name: "two weeks", duration: 7 * 2)
	end

	def self.twelve_weeks
		find_or_create_by(name: "twelve weeks", duration: 7 * 2 * 6)
	end

	def self.seventy_two_weeks
		find_or_create_by(name: "seventy-two weeks", duration: 7 * 2 * 6 * 6)
	end
end