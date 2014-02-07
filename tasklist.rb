=begin 
	(multi-line comment)
	Starting class
=end 

class Task
	@@total_count=0

	def initialize (name, priority)
		@name = name
		@priority = priority
		@@total_count += 1
	end

	def self.get_count
		return @@total_count
	end

	def self.remove_count
		@@total_count-=1
	end

	def get_name
		return @name
	end

	def get_priority
		return @priority
	end

	def print
		puts "name: #{@name}"
		puts "priority: #{@priority}"
	end
end

=begin
	end class definition
=end

def start_tasklister
	tasklist = []

	quit = false

	while !quit

		puts "Welcome to Tasklist! \n Choose one of the following to get started:"
		puts "(1) add a task"
		puts "(2) show a specific task"
		puts "(3) remove completed task"
		puts "(4) get total number of tasks"
		puts "(5) show all tasks"
		puts "(6) quit"

		option_select = gets.chomp.to_i

		if (option_select == 1)
			add_task(tasklist)
		elsif (option_select ==2)
			get_task(tasklist)
		elsif (option_select ==3)
			completed(tasklist)
		elsif (option_select ==4)
			get_count
		elsif (option_select == 5)
			print_all(tasklist)
		elsif (option_select ==6)
			puts "goodbye!"

			quit = true
		else
			puts "invalid input"
		end
	end 
end


def add_task (tasklist)
	puts "What should your task be named?"
	name = gets.chomp.capitalize!

	puts "what should the priority be?"
	priority = gets.chomp.to_i

	if (priority <= 10 && priority >= 0)
		task=Task.new(name, priority)
		tasklist.push(task)
		return tasklist
	else
		puts "priority must be between 0 and 10"
	end
end

def get_task (tasklist)
	puts "which task would you like? Select using an integer representing the index"
	task_num = gets.chomp.to_i
	if (task_num < Task.get_count)
		task = tasklist[task_num]
		task.print
	else
		puts "that is not a task in the Tasklist"
	end
end

def completed (tasklist)
	puts "which task did you finish? Select using an integer representing the index"
	task_num = gets.chomp.to_i
	if (task_num < Task.get_count)
		Task.remove_count
		return tasklist.delete(task_num)
	else 
		puts "that is not a task in the Tasklist"
	end
end

def get_count
	puts "total tasks: #{Task.get_count}"
end


def print_all (tasklist)
	tasklist.sort! { |a, b| b.get_priority<=>a.get_priority }
	tasklist.each { |task|
		task.print
		print "\n"
	}
end	


=begin
	call start_tasklister method
=end

start_tasklister

