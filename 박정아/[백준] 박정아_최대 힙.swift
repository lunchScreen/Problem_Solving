import Foundation

func solution() {
    let n = Int(readLine() ?? "") ?? 0
    var heap = [Int]()
    
    for _ in 0..<n {
        let input = Int(readLine() ?? "") ?? 0
        
        if input == 0 {
            if heap.isEmpty {
                print(0)
                continue
            }
            
            var maxNum = 0
            var maxIndex = 0
            heap.enumerated().forEach { index, num in
                if maxNum < num {
                    maxNum = num
                    maxIndex = index
                }
            }

            heap[maxIndex] = 0
            print(maxNum)
            continue
        }
        
        heap.append(input)
    }
}

solution()
