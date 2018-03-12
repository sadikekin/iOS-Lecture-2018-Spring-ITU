import Foundation

// Week 3 -  Practice Questions
// Answer for question 1

// Answer without the additional part
struct Queue<Element> {
    var container = [Element]()
    
    mutating func enqueue(item: Element){
        container.append(item)
    }
    
    mutating func dequeue() -> Element? {
        if !isEmpty() {
            return container.removeFirst()
        }
        return nil
    }
    
    func isEmpty() -> Bool {
        if container.count == 0 {
            return true
        }
        return false
    }
    
    func showQueueStatus() {
        print(container)
    }
}

// testing our queue
var myQueue1 = Queue<Int>()

// a for loop to enqueue our queue with random numbers from 1 to 100
for _ in (1...10) {
    let randomNumber = Int(arc4random() % 100 + 1)
    myQueue1.enqueue(item: randomNumber)
}

// showing the queue status
myQueue1.showQueueStatus()

// enqueueing the queue

while !myQueue1.isEmpty() {
    // note that is force unwrapped since I know that it would never go beyond its limits using the isEmpty method
    print(myQueue1.dequeue()!)
}




// Answer with the additional part

// let us copy and paste our previously implented queue and rename it


struct Queue1<Element> {
    var container = [Element]()
    let maxContainerCount = 10
    
    mutating func enqueue(item: Element){
        if container.count <= 10 {
            container.append(item)
        } else {
            print("Queue is full")
        }
    }
    
    mutating func dequeue() -> Element? {
        if !isEmpty() {
            return container.removeFirst()
        }
        return nil
    }
    
    func isEmpty() -> Bool {
        if container.count == 0 {
            print("Queue is empty!")
            return true
        }
        return false
    }
    
    func showQueueStatus() {
        print(container)
    }
}

// testing our queue
var myQueue2 = Queue1<String>()
myQueue2.enqueue(item: "A")
myQueue2.enqueue(item: "B")
myQueue2.enqueue(item: "C")
myQueue2.enqueue(item: "D")
myQueue2.enqueue(item: "E")
myQueue2.enqueue(item: "F")
myQueue2.enqueue(item: "G")
myQueue2.enqueue(item: "H")
myQueue2.enqueue(item: "I")
myQueue2.enqueue(item: "J")
myQueue2.enqueue(item: "K")
// print it will yell us that our queue is full
myQueue2.enqueue(item: "L")

while !myQueue2.isEmpty() {
    print(myQueue2.dequeue()!)
}






