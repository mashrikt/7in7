# Evaluate 1 + 1 and then 1 + "one". Is Io strongly typed or weakly
# typed? Support your answer with code.
# Strongly typed. The code below will raise an error as the types collide.
# 1 + "1" 


# Is 0 true or false? What about the empty string? Is nil true or false?
# Support your answer with code.
if(0,   "true", "false") println    # true
if("",   "true", "false") println   # true
if(nil,   "true", "false") println  # false


# How can you tell what slots a prototype supports?
Vehicle := Object clone
Vehicle doors := 4
Vehicle slotNames    # list(type, doors)


# What is the difference between = (equals), := (colon equals), and ::=
# (colon colon equals)? When would you use each one?
# ::=	Creates slot, creates setter, assigns value
# :=	Creates slot, assigns value
# =	Assigns value to slot if it exists, otherwise raises exception


# Run an Io program from a file
# Run "io day1.io"


# Execute the code in a slot given its name.
Vehicle := Object clone
Vehicle drive := method("Vroom vroom" println)
Vehicle drive
