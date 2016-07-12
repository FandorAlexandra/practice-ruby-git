class Item
	attr_reader :name
	attr_reader :due_date
	attr_reader :priority
	attr_reader :done
	def initialize(name, due_date, priority)
		@name = name
		@due_date = due_date
		@priority = priority
		@done = false
	end

	def mark_done
		@done = true
	end

	def set_due_date(new_date)
		@due_date = new_date
	end

	def set_priority(new_priority)
		@priority = new_priority
	end

	def set_name(new_name)
		@name = new_name
	end
end
