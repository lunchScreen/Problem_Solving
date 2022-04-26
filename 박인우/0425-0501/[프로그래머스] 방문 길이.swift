import Foundation

func solution(_ dirs:String) -> Int {
    var memo = Set<String>()
    var coordinate = (0,0)
    
    for dir in dirs.map { String($0) } {
        if dir == "U" && coordinate.1 < 5 {
            memo.insert("\(coordinate)U")
            coordinate = (coordinate.0, coordinate.1+1)
            memo.insert("\(coordinate)D")
        } else if dir == "D" && coordinate.1 > -5 {
            memo.insert("\(coordinate)D")
            coordinate = (coordinate.0, coordinate.1-1)
            memo.insert("\(coordinate)U")
        } else if dir == "R" && coordinate.0 < 5 {
            memo.insert("\(coordinate)R")
            coordinate = (coordinate.0+1, coordinate.1)
            memo.insert("\(coordinate)L")
        } else if dir == "L" && coordinate.0 > -5{
            memo.insert("\(coordinate)L")
            coordinate = (coordinate.0-1, coordinate.1)
            memo.insert("\(coordinate)R")
        }
    }
    
    return memo.count/2
}
