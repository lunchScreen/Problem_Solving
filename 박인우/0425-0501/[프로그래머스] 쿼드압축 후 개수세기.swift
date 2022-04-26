import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    func compression(_ arr: [[Int]]) -> [Int] {
        let n = arr.count
        let sum = arr.reduce(0) { $0 + $1.reduce(0, +) }
        
        if sum == n*n {
            return [0,1]
        } else if sum == 0 {
            return [1,0]
        }
        
        let result1 = compression(arr.enumerated().filter {
            $0.offset < n/2
        }.map {
            Array($0.element[0..<n/2])
        })
        
        
        let result2 = compression(arr.enumerated().filter {
            $0.offset < n/2
        }.map {
            Array($0.element[n/2..<n])
        })
        
        let result3 = compression(arr.enumerated().filter {
            $0.offset >= n/2
        }.map {
            Array($0.element[0..<n/2])
        })
        
        let result4 = compression(arr.enumerated().filter {
            $0.offset >= n/2
        }.map {
            Array($0.element[n/2..<n])
        })
        
        return [result1[0]+result2[0]+result3[0]+result4[0],
               result1[1]+result2[1]+result3[1]+result4[1]]
    }
    
    return compression(arr)
}
