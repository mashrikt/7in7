# Write a program to find the nth Fibonacci
# number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem
# with recursion and with loops.
fib := method(n, if(n<=2, 1, fib(n-1) + fib(n-2)))
fib(9) println     # 34

fib2 := method(n,
  a := 0
  b := 1
  t := 1
  for(i, 2, n, 1, 
    t = a + b
    a = b
    b = t
  )
  t 
)
fib2(9) println     # 34


# How would you change / to return 0 if the denominator is zero?
originalDivision  := Number getSlot("/")
Number / = method(denom, if(denom == 0, 0, originalDivision(denom)))
4/0    # 0


# Write a program to add up all of the numbers in a two-dimensional
# array.
arr := list(list(1, 2), list(3, 4))
arr flatten sum


# Add a slot called myAverage to a list that computes the average of
# all the numbers in a list. What happens if there are no numbers
# in a list? (Bonus: Raise an Io exception if any item in the list is not
# a number.)

List myAverage := method(
              total := 0
              self foreach(i, 
                if (i isKindOf(Number) != isTrue, 
                  Exception raise("Not all items in this list are Numbers"), total = total + i))
              sum/size
            )
a := list(11, 27, 99)
a myAverage println

b := list(1, 2, "a")
# b myAverage println


# Write a prototype for a two-dimensional list. The dim(x, y) method
# should allocate a list of y lists that are x elements long. set(x, y,
# value) should set a value, and get(x, y) should return that value.
List2D := List clone
List2D dim := method(x, y,
		            arr := List2D clone 
                y repeat(
		              arr append(List2D clone setSize(x))
                )
              )
List2D get := method(x, y, at(y) at(x))
List2D set := method(x, y, value, at(y) atPut(x, value))

l := List2D dim(2,3)
l println
l get(1, 1) println
l set(0, 2, "foo")
l println


# Bonus: Write a transpose method so that (new_matrix get(y, x)) ==
# matrix get(x, y) on the original list.
List2D transpose := method(
                      new_l := self at(0) size 
                      new_w := self size
                      transposed := List2D dim(new_w, new_l)
                      for (i, 0, new_l-1,
                        for (j, 0, new_w-1,
                          transposed set(j, i, self get(i, j))
                        )
                      )
                      transposed
                    )

l := List2D dim(2,3)
l set(0, 2, "foo")
transposed := l transpose 
l get(0, 2) println
transposed get(2, 0) println


# Write the matrix to a file, and read a matrix from a file.
m := list(list(1,2,3,4), list(5,6,7,7))
f := File with("matrix.txt")
f remove
f openForUpdating
w := m at(0) size
l := m size
for (i, 0, l-1,
  f write(m at(i) join(", "))
  f write("\n") 
)
f close 

m := List clone
f := File with("matrix.txt")
f openForReading
line := f readLine
while (line != nil,
  row := list(line)
  m append(row)
  line println
  line := f readLine
)
f close
m println


# Write a program that gives you ten tries to guess a random number
# from 1–100. If you would like, give a hint of “hotter” or “colder”
# after the first guess.
ans := Date now second * 100 / 60
ans = ans round
count := 0
guess := 0

"Guess a number between 1 to 100" println
while (guess != ans and count < 10,
  guess = File standardInput readLine asNumber()
  count = count + 1
  if (guess < ans, "Too Cold" println)
  if (guess > ans, "Too Hot" println)
)

if (guess == ans, 
  "Winner winner chicken dinner!" println,
  "It's okay! Please try again!" println
) 
