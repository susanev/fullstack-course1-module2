some_var = "false"
another_var = "nil"

case
	# fails because "false" is not equavlent to "pink elephant"
	when some_var == "pink elephant"
	  puts "Don't think about the pink elephant!"

	# fails because the string "nil" is not nil, its true
	when another_var.nil?
	  puts "Question mark in the method name?"

	# fails because the string "false" is not false, its true
	when some_var == false
	  puts "Looks like this one should execute"

	# succeeds
	else
	  puts "I guess nothing matched... But why?"
end