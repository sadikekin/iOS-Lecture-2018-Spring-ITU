let n : Double = 11.0
var isPrime = true
// We can only look until square root n for checking n is prime or not.
for i in 2...(Int(n.squareRoot())+1){
    if(Int(n)%i == 0 && Int(n) != i){
        isPrime = false
        break
    }
}
if(isPrime){
    print("Prime")
}else{
    print("Not Prime")
}
