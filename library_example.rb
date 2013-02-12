# encoding: utf-8

#
# Exempel på arv
#

class LibraryItem
	@@previous_id = 0

	def initialize
		@id = unique_id
	end

	def description
		"LibraryItem: #{@id}, object_id #{self.object_id}\n  "
	end

	private
	# genererar unika id:n för instanser av klasser som ärver från LibraryItem
	def unique_id
		@@previous_id +=1
	end
end

class Book < LibraryItem # vi ärver från klassen LibraryItem
	attr_accessor :title, :author

	def initialize( title = "book title", author = "nn")
		@title = title
		@author = author
		super() # anropa initialize i LibraryItem utan argument
	end

	def description
		super + "Book: #{@title} by #{@author}"
	end
end

class Film < LibraryItem
	attr_accessor :title, :director

	def initialize( title = "film title", director = "nn" )
		@title = title
		@director = director
		super()
	end

	def description
		super + "Film: #{@title} by #{@director}"
	end
end

book = Book.new( "Neuromancer", "William Gibson" )
film = Film.new( "Aliens", "James Cameron" )

library = [book, film]
library.each do |item|
	puts "#{item.class} is a LibraryItem: #{item.is_a?(LibraryItem)}"
	puts item.description
end
