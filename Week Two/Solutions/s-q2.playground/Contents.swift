//: Playground - noun: a place where people can play

import Foundation

// Creating the stuct
struct Point {
    var longitude : Double
    var latitude : Double
}

// Function that takes two paramaters and return distance between them
func findTheDistance(withPoint point: Point,withSecondPoint pointTwo : Point) -> Double{
    // Distance longitude between points
    let distanceBetweenLongitudes = abs(point.longitude-pointTwo.longitude)
    // Distance latitude between points
    let distanceBetweenLatitudes = abs(point.latitude-pointTwo.latitude)
    // squareRoot(a**2 + b**2)
    return sqrt( distanceBetweenLongitudes * distanceBetweenLongitudes + distanceBetweenLatitudes * distanceBetweenLatitudes)
}

let pointOne = Point.init(longitude: 3.0, latitude: 3.0)
let pointTwo = Point.init(longitude: 7.0, latitude: 6.0)
print(findTheDistance(withPoint: pointOne, withSecondPoint: pointTwo))
