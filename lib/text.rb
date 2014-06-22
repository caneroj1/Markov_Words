module Markov
	class Text
		attr_reader :content, :length

		def initialize(content)
			@content = content
			@length = find_length
		end

		def self.from_file(path)
			contents = ""
			begin
				file = File.open(path, 'r') do |f|
					f.each_line do |line|
						line.split(" ").each do |word|
							contents << word << " "
						end
					end
				end
			rescue => error
				puts "Rescued error: #{error}"
			ensure
				t = Text.new(contents)
			end
			t
		end

		private
		def find_length
			content.length
		end
	end
end