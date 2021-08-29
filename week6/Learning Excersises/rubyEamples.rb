#! /usr/bin/ruby

puts("Hello")
puts("hi there")


vlaue = "blah"  #value as a strig

items = [1,2,4,35,15,18]  #For loop - List of items.Signe varible contatins each of these items in an arrey. 


#Print out the string vlaue. 
puts (" ")
puts("the value is " + vlaue)
puts (" ")
puts (" ")
puts ("First way of outputting the arrey contents")

items.each do | item |
    puts(item)
end
puts (" ")
#Second way of wrting the for loop. 
puts ("Second way of outputting the arrey contents")

for item in items
    puts(item)
end

#Third way of wrting the for loop. 
puts (" ")
puts ("Third way of outputting the arrey contents")
items.each { | item | puts(item) }   #This is a good way to do things, since it's one line and sucsint. 

#Forth way of wrting the for loop. 
puts (" ")
puts ("Fourth way of outputting the arrey contents")
puts(items)  #puts has an lamda function that it can be written this way. 

