import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var matrix = [[Int]]()
    var answer = [Int]()
    
    for i in 0..<rows {
        var temp = [Int]()
        for j in 1...columns {
            temp.append(columns*i + j)
        }
        matrix.append(temp)
    }
    
    for query in queries {
        let x1 = query[0]-1
        let x2 = query[2]-1
        let y1 = query[1]-1
        let y2 = query[3]-1
        
        var list = [Int]()
        var minValue = matrix[x1+1][y1]
        var store = matrix[x1+1][y1]
        
        for y in y1...y2 {
            var temp = store
            store = matrix[x1][y]
            matrix[x1][y] = temp
            minValue = min(minValue, store)
        }
        
        for x in x1+1...x2 {
            var temp = store
            store = matrix[x][y2]
            matrix[x][y2] = temp
            minValue = min(minValue, store)
        }
        
        for y in stride(from: y2-1, through: y1, by: -1) {
            var temp = store
            store = matrix[x2][y]
            matrix[x2][y] = temp
            minValue = min(minValue, store)
        }
        
        for x in stride(from: x2-1, through: x1+1, by: -1) {
            var temp = store
            store = matrix[x][y1]
            matrix[x][y1] = temp
            minValue = min(minValue, store)
        }
        
        answer.append(minValue)
    }
    
    return answer
}
