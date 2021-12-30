import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let goalProfit = input[0]
    let profit = input[2] - input[1]
    
    if profit <= 0 {
        print(-1)
        return
    }
    
    print(goalProfit / profit + 1)
}

solution()

 
