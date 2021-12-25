import Foundation

func solution(_ s:String) -> [Int] {
    var order: [Int:Int] = [:]
    var a = Array(s)
    a.removeFirst(2); a.removeLast(2)
    a.map(){"\($0)"}.joined().components(separatedBy: "},{").map(){
        $0.split(separator: ",").map(){Int($0)!}
    }.sorted() {$0.count < $1.count}.forEach() { tuple in
        tuple.forEach() {
            if order[$0] == nil {order.updateValue(tuple.count, forKey: $0)}
        }
    } 
    return order.keys.sorted() {order[$0]! < order[$1]!}
}
