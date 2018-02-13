let n = 41 // n value will be 1 < n < 3999
var s = ""
// Symbol    I    V    X    L    C    D    M
// Value    1    5    10    50    100    500    1,000
let one = ["0": "", "1": "I", "2": "II", "3": "III", "4": "IV", "5": "V", "6": "VI", "7": "VII", "8": "VIII", "9": "IX"]
let two = ["0": "", "1": "X", "2": "XX", "3": "XXX", "4": "XL", "5": "L", "6": "LX", "7": "LXX", "8": "LXXX", "9": "XC"]
let three = ["0": "", "1": "C", "2": "CC", "3": "CCC", "4": "CD", "5": "D", "6": "DC", "7": "DCC", "8": "DCCC", "9": "CM"]
let four = ["1": "M", "2": "MM", "3": "MMM"]
var i = 0
//Creating reverse array fron given integer and check its digits one by one
let arrayGivenInt = Array(Array(String(n)).reversed())
while(i < arrayGivenInt.count){
    if(i == 0){
        s = one[String(arrayGivenInt[i])]! + s
    }else if(i == 1){
        s = two[String(arrayGivenInt[i])]! + s
    }else if(i == 2){
        s = three[String(arrayGivenInt[i])]! + s
    }else {
        s = four[String(arrayGivenInt[i])]! + s
    }
    i += 1
}
print(s)
