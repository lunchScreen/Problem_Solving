import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64 {
    let result = Int64((1...count).map{ price * $0 }.reduce(0, +) - money)
    return result > 0 ? result : 0
}
