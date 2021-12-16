import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var arr = makeMatrix(rows, columns)
    var answer = [Int]()
    
    queries.forEach { query in
        let x1 = query[0] - 1
        let y1 = query[1] - 1
        let x2 = query[2] - 1
        let y2 = query[3] - 1
        let x1y1 = arr[x1][y1]
        var nums = Set<Int>()
        
        (x1+1...x2).forEach { x in
            let num = arr[x][y1]
            arr[x-1][y1] = num
            nums.insert(num)
        }
        
        (y1+1...y2).forEach { y in
            let num = arr[x2][y]
            arr[x2][y-1] = num
            nums.insert(num)
        }
        
        (x1...x2-1).reversed().forEach { x in
            let num = arr[x][y2]
            arr[x+1][y2] = num
            nums.insert(num)
        }
        
        (y1...y2-1).reversed().forEach { y in
            let num = arr[x1][y]
            arr[x1][y+1] = num
            nums.insert(num)
        }
        
        arr[x1][y1 + 1] = x1y1
        nums.insert(x1y1)
        
        if let min = nums.min() {
            answer.append(min)
        }
    }
    
    return answer
}

func makeMatrix(_ rows: Int, _ columns: Int) -> [[Int]] {
    var arr = Array(repeating: Array(repeating: 1, count: columns), count: rows)
    var num = 1
    
    (0..<rows).forEach { row in
        (0..<columns).forEach { column in
            arr[row][column] = num
            num += 1
        }
    }
    
    return arr
}
