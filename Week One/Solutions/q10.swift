let str = "[]{(})"

var array = [String]()

for e in Array(str){
    // For each element("{", "(", "}") if that element closes we just take its pair form array. If its not we push it to array.
    if(e == "]"){
        if let lastElement = array.last {
            if(lastElement == "["){
                array.removeLast()
            }
        }
    }else if(e == "}"){
        if let lastElement = array.last {
            if(lastElement == "{"){
                array.removeLast()
            }
        }
    }else if(e == ")"){
        if let lastElement = array.last {
            if(lastElement == "("){
                array.removeLast()
            }
        }
    }else{
        array.append(String(e))
    }
}
// In the last if we matched every paranthesis. It is true
if(array.isEmpty){
    print("True")
}else{
    print("False")
}
