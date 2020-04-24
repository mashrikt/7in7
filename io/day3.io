# Enhance the XML program to add spaces to show the indentation
# structure
Builder := Object clone
Builder spaces := 0

Builder forward := method(
  Builder spaces repeat(" " print); writeln("<", call message name, ">")
  Builder spaces = Builder spaces + 2
  call message arguments foreach(
    arg,
    content := self doMessage(arg); 
    if(content type == "Sequence", 
      Builder spaces repeat(" " print); writeln(content)
    )
  )
  Builder spaces = Builder spaces - 2
  Builder spaces repeat(" " print); writeln("</", call message name, ">")
)


Builder  ul(
	li("Io"), 
	li("Lua"), 
	li("JavaScript"))
  
  
# Create a list syntax that uses brackets
squareBrackets := method(
  call message arguments
)
List squareBrackets := method(index, value,
  if(value == nil, return s at(index), s atPut(index, value))
)

s := [1,2,3]
s[0] println    # 1
s[0, 123]
s println       # list(123, 2, 3)
s[0] println    # 123
