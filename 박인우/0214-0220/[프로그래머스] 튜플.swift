import Foundation

func solution(_ s:String) -> [Int] {
    var str = s
    var dic = [String:Int]()
    str.removeFirst(2)
    str.removeLast(2)
    
    str.components(separatedBy: "},{").map {
        $0.components(separatedBy: ",").forEach {
            dic[$0, default: 0] += 1
        }
    }
    
    return dic.sorted(by: {
        $0.value > $1.value
    }).compactMap {
        Int($0.key)
    }
}
