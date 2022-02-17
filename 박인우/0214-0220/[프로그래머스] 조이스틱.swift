import Foundation

func solution(_ name:String) -> Int {
    var na = Array(name)
    let aValue = Int(Character("A").asciiValue!)
    let zValue = Int(Character("Z").asciiValue!)
    
    var updown = 0    
    var leftright = na.count-1  
    
    for i in 0..<na.count {
        updown += min(Int(na[i].asciiValue!) - aValue, zValue - Int(na[i].asciiValue!) + 1)
        
        var idx = i + 1
        while idx < na.count && na[idx] == "A" {
            idx += 1
        }
        let moveFront = i * 2 + (na.count - idx)
        let moveBack = (na.count - idx) * 2 + i
        leftright = min(leftright, moveFront)
        leftright = min(leftright, moveBack)
    }
    
    return updown + leftright
}
