class Url < ApplicationRecord
	def shorten
		short=(('a'..'z').to_a+ ('A'..'Z').to_a+ (0..9).to_a).sample(7).join
		@url= Url.new(long_url: params["long_url"], short_url: short)
		@url.save	
	end

	validates :long_url, presence: true
	validates :long_url, uniqueness: {case_sensitive: false, message: "Was shortened before"}

	validates :long_url, format: {with: (URI::regexp(['http', 'https'])), message: "Format is not good"}
end
