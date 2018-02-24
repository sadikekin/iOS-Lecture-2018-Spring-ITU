import Foundation

var board = [[Int]](repeating: [Int](repeating :0, count: 10), count: 10) // Creatin 10 by 10 board
print(board)

var emptySpaces = [[Int]]()
for i in 0..<10{
    for j in 0..<10{
        emptySpaces.append([i,j])
    }
}
print(emptySpaces)
// In this for we are selecting one empty space randomly and assign 1 to that empty space. Moreover, we are deleting that selected empty space. Because it is not an emtpy space any more.
for _ in 0..<5{
    let selectedEmptySpace = Int(arc4random_uniform(UInt32(emptySpaces.count-1)))
    let selectedLocation = emptySpaces[selectedEmptySpace]
    emptySpaces.remove(at: selectedEmptySpace)
    board[selectedLocation[0]][selectedLocation[1]] = 1
}
print(board)

