require_relative 'generator.rb'
require_relative 'text.rb'

# text = %q{Sgt. Pepper's Lonely Hearts Club Band is the eighth studio album by the English rock band the Beatles (pictured). Released on 1 June 1967, it was an immediate commercial and critical success. After the group retired from touring, Paul McCartney had an idea for a song involving an Edwardian era military band, and this developed into a plan to release an entire album as a performance by the fictional Sgt. Pepper band. Knowing they would not have to perform the tracks live, the Beatles adopted an experimental approach to composition, writing songs such as "With a Little Help from My Friends", "Lucy in the Sky with Diamonds" and "A Day in the Life". The producer George Martin's innovative recording of the album included the liberal application of signal processing. The cover, depicting the band in front of a collage of celebrities and historical figures, was designed by the English pop artists Peter Blake and Jann Haworth. One of the best-selling albums of all time, Sgt. Pepper is regarded as an important work of British psychedelia and an early concept album. One music scholar has described it as "the most important and influential rock and roll album ever recorded}

# generator = Markov::Generator.new(text, 5, 100)
# puts generator.generate_text

# corpus = Markov::Text.from_file("sample.txt")
# puts corpus.content

iliad = Markov::Text.from_file("iliad.txt")
generator2 = Markov::Generator.new(iliad.content, 4, 500)
puts generator2.generate_text

# cattle = Markov::Text.from_file("cattle.txt")
# generator3 = Markov::Generator.new(cattle.content, 4, 300)
# puts generator3.generate_text