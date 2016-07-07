require_relative 'todo_item_class.rb'

class ToDoList
	def initialize(name = "TODO")
		@name = name
		@list = Hash.new #maps name of item to item object
	end

	#if completed, include items that are done
	def get_priority_list(completed = false)
		sorted_items = list.values.sort {
			|item_a, item_b| item_a.priority <=> item_b.priority
		}
		if(completed)
			return sorted_items
		else
			filtered = sorted_items.select {
				|item| !item.done?
			}
		end
	end

	#if completed, include items that are done
	def get_due_date_list(completed = false)
		sorted_items = list.values.sort {
			|item_a, item_b| item_a.due_date <=> item_b.due_date
		}
		if(completed)
			return sorted_items
		else
			filtered = sorted_items.select {
				|item| !item.done?
			}
		end
	end

	def add_item(new_item)
		list[new_item.get_name] = new_item
	end

	def get_item(item_name)
		return list[item_name]
	end

	def delete_item(item_name)
		list.delete(item_name)
	end

	def complete_item(item_name) {
		if(list[new_item.get_name])
			list[new_item.get_name].mark_done
		end
	}

end
