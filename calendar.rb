=begin 
	(multi-line comment)
	Starting class
=end 

class Event
	def initialize (name, date, location)
		@name = name
		@date = date
		@location = location
	end

	def show()
		puts "name: #{@name}   date: #{@date} location: #{@location} \n"
	end

	def get_date()
		return @date
	end
end

=begin
	end class definition
=end

def start_calendar()
	calendar = []

	quit = false

	while !quit

		puts "Welcome to your calendar! \n Choose one of the following options"
		puts "1. Add an event"
		puts "2. Show an event"
		puts "3. Delete an event"
		puts "4. Get the total number of events"
		puts "5. Show all the events"
		puts "6. Exit this program"

		selected = gets.chomp.to_i

		if(selected == 1)
			add_event(calendar)
		elsif(selected ==2)
			show_event(calendar)
		elsif(selected ==3)
			delete(calendar)
		elsif(selected ==4)
			puts "Total number of events: " + calendar.length.to_s
		elsif(selected ==5)
			show_all(calendar)
		elsif(selected ==6)
			puts "Quitting"
			quit = true
		else 
			puts "invalid input"
		end
	end
end


def add_event(calendar)
	puts "What's the event named?"
	name = gets.chomp.capitalize!
	
	puts "what's the event's month?"
	month = gets.chomp.to_i
	
	puts "what's the event day?"
	day = gets.chomp.to_i
	
	puts "What's the event year?"
	year = gets.chomp.to_i
	
	if (year > 2013 && day > 0 && day < 32 && month > 0 && month < 13)
		puts "Where's this event going down?"
		location = gets.chomp.capitalize!
		date = year.to_s + "." + month.to_s + "." + day.to_s

		event = Event.new name, date, location
		calendar.push(event)
		return calendar
	else 
		puts "You entered invalid date information \n Month must be between 1 and 12, \n day must be between 1 and 31, \n and year must be after 2013"
	end
end

def show_event(calendar)
	puts "Which event would you like to see? (give me an index)"
	index = gets.chomp.to_i
	if (index < calendar.length && index >= 0)
		calendar[index].show
	else
		puts "index wasn't in the range of 0-#{calendar.length}"
	end
end

def delete(calendar)
	puts "Which event are you trying to delete? (give me an index)"
	index = gets.chomp.to_i
	if (index < calendar.length && index >= 0)
		calendar.delete_at(index)
		puts "Glad to get that out of the way, your event has been deleted"
	else
		puts "index wasn't in the range of 0-#{calendar.length}"
	end
end

def sort_date (a,b)
	a = a.get_date
	b = b.get_date
	a_date = a.rpartition(".")
	b_date = b.rpartition(".")
	a_year = a_date[0].to_i
	b_year = b_date[0].to_i
	if (a_year != b_year)
		return a_year <=> b_year
	end
	a_month = a_date[1].to_i
	b_month = b_date[1].to_i
	
	if (a_month != b_month)
		return a_month <=> b_month
	else
		return a_date[2].to_i <=> b_date[2].to_i
	end
end

def show_all(calendar)
	calendar.sort! { |a, b| sort_date(a,b)}
	calendar.each {
		|event|
		event.show
	}
end



=begin
	call start_calendar method
=end

start_calendar
