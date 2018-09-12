/*:
 ## Exercise - Return Values and Tuples
 
 Write a function called `greeting` that takes a `String` argument called name, and returns a `String` that greets the name that was passed into the function. I.e. if you pass in "Dan" the return value might be "Hi, Dan! How are you?" Use the function and print the result.
 */
func greeting(name: String) -> String {
   return "hi \(name) how are you"
}

print(greeting(name: "ben"))

/*:
 Write a function that takes two `Int` arguments, and returns an `Int`. The function should multiply the two arguments, add 2, then return the result. Use the function and print the result.
 */
func multiplynum(one: Int, two: Int) -> Int{
    let result = one * two + 2
    return result
    
}
print(multiplynum(one: 1, two: 1))

//: [Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Separating Functions](@next)
