require_relative 'todo_item_class.rb'
require_relative 'todo_list_class.rb'
require 'colorize'
require 'date'

class ListRobot

	def initialize
		puts "Welcome to your To-Do List! Let's get started!"

		#initialize list
		puts "To-Do List name: "
		list_name = gets.chomp
		@list = ToDoList.new(list_name)
		puts "Created To-Do List with name #{@list.name}".blue
	end

	def input_date
		loop do
			puts "Now enter the due date in the form \"dd-mm-yyyy\": "
			date_input = gets.chomp
			d, m, y = date_input.split('-')
			if Date.valid_date? y.to_i, m.to_i, d.to_i
				begin
				 	 return Date.parse(date_input)
				#rescue Exception => e
				end
			end
			puts "Oops! Invalid date -- try again!".red
		end
	end

	def input_priority
		loop do
			puts "Now enter priority. Remember: 1 = high, 2 = medium, 3 = low"
			priority = gets.chomp
			if (1..3).include? priority.to_i
				return priority.to_i
			end
			puts "Oops! Invalid priority -- try again! ".red
		end
	end


	def initialize_list
		puts "Welcome to your To-Do List! Let's get started!"

		#initialize list
		puts "To-Do List name: "
		list_name = gets.chomp
		@list = ToDoList.new(list_name)
		puts "Created To-Do List with name #{@list.name}".blue
	end

	def get_sort_type
		sort_type = ""
		puts "Would you like to sort your list by priority or due date? [p/d]"
		sort_type = gets.chomp
		while sort_type != 'p' && sort_type != 'd'
			puts "Please enter 'p' for priority or 'd' for due date".red
			sort_type = gets.chomp
		end
	end

	def completed?
		completed = ""
		puts "Would you like the list to include items that are completed? [y/n]"
		completed = gets.chomp
		while completed != 'y' && completed != 'n'
			puts "Please enter 'y' to include completed items, or 'n' to not include them".red
			completed = gets.chomp
		end
		completed = completed == 'y' ? true : false
	end

	def print_list
		sort_type = get_sort_type
		completed = completed?
		puts "\nTODO LIST: #{@list.name}".blue
		if sort_type == 'p'
			sorted_list = @list.priority_list(completed)
			sorted_list.each do |item|
				mark_completed = item.done ? " COMPLETED" : ""
				puts "\"#{item.name}\" -- priority: #{item.priority} -- due: #{item.due_date}" + mark_completed
			end
		else
			sorted_list = @list.due_date_list(completed)
			sorted_list.each do |item|
				mark_completed = item.done ? " COMPLETED" : ""
				puts "\"#{item.name}\" -- due: #{item.due_date} -- priority: #{item.priority}" + mark_completed
			end
		end
	end


	def help
		puts "TODO COMMANDS: ".blue
		print "print: ".blue
		puts "Print out your list, ordered by priority or due date"

		print "add: ".blue
		puts "Add a new item to your todo list"

		print "complete: ".blue
		puts "Mark an item as complete"

		print "delete: ".blue
		puts "Delete an item"

		print "exit: ".blue
		puts "Exit ToDo List App"
	end

	def add
		puts "Enter the name of your item: "
		name = gets.chomp
		due_date = input_date
		priority = input_priority

		item = Item.new(name, due_date, priority)
		@list.add_item(item)
		puts "NEW ITEM: \"#{item.name}\" -- priority: #{item.priority} -- due: #{item.due_date}".blue
	end

	def complete
		puts "Enter the name of the item you'd like to complete, or enter 'EXIT' to cancel"
		input = gets.chomp
		if input == "EXIT"
			return
		end
		@list.complete_item(input)
	end

	def delete
		puts "Enter the name of the item you'd like to delete, or enter 'EXIT' to cancel"
		input = gets.chomp
		if input == "EXIT"
			return
		end
		@list.delete_item(input)
	end

	def interact_with_list
		puts "Wow! You've now started a list called \"#{@list.name}\"!"
		puts "Items consist of a name, due date, and priority (1 = high, 2 = medium, 3 = low)"
		puts "Now it's time to interact! Type \"help\" if you would like to know how to interact with your list"

		loop do
			input = gets.chomp
			case input
			when "help"
				help
			when "print"
				print_list
			when "add"
				add
			when "complete"
				complete
			when "delete"
				delete
			when "EXIT"
				exit
			else
				puts "I'm sorry, that is not a command I understand. Enter \"help\"
				to see list of commands"
			end
			puts "\nWhat would you like to do now?"
		end
	end

end

ListRobot.new.interact_with_list






