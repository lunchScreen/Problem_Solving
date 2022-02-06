import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    return (left...right).map { i in
        (1...i).filter { i % $0 == 0 }.count % 2 == 0 ? i : -i 
    }.reduce(0, +)
}
