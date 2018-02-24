let a = [1,2,3,4,5]

var aFromBeginning = [1]
var aProductBeginning = 1
for e in a {
    aProductBeginning *= e
    aFromBeginning.append(aProductBeginning)
}
// For aFromBeginning Array, we multiply every element one by one and place it to its place.
print("Array Multiplied From Beginning: \(aFromBeginning)")

var aFromEnd = [Int]()
var aProductEnd = 1
for e in  a.reversed(){
    aProductEnd *= e
    aFromEnd.append(aProductEnd)
}
aFromEnd = aFromEnd.reversed()
aFromEnd.append(1)

// For aFromEnd Array, we multiply every element one by one and place it to its place reversely.
print("Array Multiplied From End: \(aFromEnd)")

var finalArray = [Int]()
for i in 1...(a.count) {
    finalArray.append(aFromBeginning[i-1]*aFromEnd[i])
}
// We didn't use division and we didnt use loop inside a loop.
print("Final Solution by using last 2 array: \(finalArray)")



