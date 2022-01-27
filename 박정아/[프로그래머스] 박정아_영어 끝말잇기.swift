import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var tmp = [String]()
    
    for (i, word) in words.enumerated() {
        if tmp.contains(word) {
            let num = i % n + 1
            let turn = i / n + 1
            return [num, turn]
        }
        
        if let prevWord = tmp.last {
            if prevWord.last != word.first {
                let num = i % n + 1
                let turn = i / n + 1
                return [num, turn]
            }
        }
        
        tmp.append(word)
    }
    
    return [0, 0]
}
