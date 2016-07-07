class Item
	def initialize(name, due_date, priority)
		@name = name
		@due_date = due_date
		@priority = priority
		@done = false
	end

	def done?
		return @done
	end

	def get_name
		return @name
	end

	def get_due_date
		return @due_date
	end

	def get_priority
		return @priority
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
