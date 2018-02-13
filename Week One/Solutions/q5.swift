let s = "abcba"
// We can not use s[1] iin swift. So we have to change String to Char Array.
let stringArray = Array(s)
var isPalindrom = true
for i in 0..<((s.count/2)+1){
    // This if checks if string chars equal to each other according to palindrom rules
    if(stringArray[i] != stringArray[s.count-1-i]) {
        isPalindrom = false
        break
    }
}

if(isPalindrom){
    print("Palindrom")
}else{
    print("Not Palindrom")
}
