var n = 70304
var finalStringArray = [String]()
var m = 1
// while n is greater than 0 we append its digits to string array.
while(n>0){
    let temp = String((n%10)*m)
    if(temp != "0"){
        finalStringArray.append(temp)
    }
    n = n/10
    m *= 10
}
let reversedFinalStringArray = Array(finalStringArray.reversed())
// we reverse that string array and concat them with seperator " + "
let finalString = reversedFinalStringArray.joined(separator: " + ")
print(finalString)
