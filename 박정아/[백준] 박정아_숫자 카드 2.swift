import Foundation

solution()

func solution() {
    let n = Int(readLine()!)
    let ownCards = readLine()!.split(separator: " ").map(){Int(String($0))!}
    let m = Int(readLine()!)
    let cards = readLine()!.split(separator: " ").map(){Int(String($0))!}
    var map: [Int : Int] = [ : ]
    
    ownCards.forEach {
        if map.keys.contains($0) { map[$0]! += 1 }
        else { map[$0] = 1 }
    }
    
    cards.forEach {
        print(map.keys.contains($0) ? map[$0]! : 0, terminator: " ")
    }
}
