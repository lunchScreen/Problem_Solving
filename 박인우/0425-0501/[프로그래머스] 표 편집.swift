// 시간초과

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    
    var arr = Array(repeating: true, count: n)
    
    var index = k
    var stack = [Int]()
    
    for ca in cmd {
        let c = ca.map { String($0) }
        if c[0] == "U" {
            var count = Int(c[2..<c.count].joined())!
            while count > 0 {
                index -= 1
                if index == -1 { index = n-1 }
                if arr[index] { 
                    count -= 1 
                }
            }
        } else if c[0] == "D" {
            var count = Int(c[2..<c.count].joined())!
            while count > 0 {
                index = (index + 1) % n
                if arr[index] { 
                    count -= 1 
                }
            }
        } else if c[0] == "C" {
            arr[index] = false
            stack.append(index)
            var direction = 1
            var temp = index
            while arr[temp] == false {
                temp += direction
                if temp == n {
                    direction = -1
                    temp = index
                }
            }
            index = temp
        } else if c[0] == "Z" {
            let now = stack.removeLast()
            arr[now] = true
        }
    }
    
    return arr.map { $0 ? "O" : "X" }.joined()
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    
    var arr = Array(repeating: [Int](), count: n)
    
    for i in 0..<n {
        arr[i] = [i-1, i+1, 1]
    }
    arr[0][0] = n-1
    arr[n-1][1] = 0
    
    var index = k
    var stack = [Int]()
    
    for c in cmd {
        let c = c.components(separatedBy: " ")
        if c[0] == "U" {
            for _ in 1...Int(c[1])! {
                index = arr[index][0]
            }
        } else if c[0] == "D" {
            for _ in 1...Int(c[1])! {
                index = arr[index][1]
            }
        } else if c[0] == "C" {
            stack.append(index)
            arr[index][2] = 0
            let pre = arr[index][0]
            let nxt = arr[index][1]
            arr[pre][1] = nxt
            arr[nxt][0] = pre
            index = nxt == 0 ? pre : nxt
        } else if c[0] == "Z" {
            let now = stack.removeLast()
            let pre = arr[now][0]
            let nxt = arr[now][1]
            arr[now][2] = 1
            arr[pre][1] = now
            arr[nxt][0] = now
        }
    }
    return arr.map { $0[2] == 1 ? "O" : "X" }.joined()
}


