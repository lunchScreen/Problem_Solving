import Foundation

func solution() {
    var n = (readLine()!).map{ Int(String($0))! }
    n.sort{ $0 > $1 }
    n.forEach {
        print($0, terminator: "")
    }
}

solution()

