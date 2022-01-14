import Foundation

func baekjoon9935() {
    let input = readLine()!.map { String($0) }
    let bomb = readLine()!.map { String($0) }
    let bombIndex = bomb.count - 1

    var stack = [String](repeating: "", count: input.count)
    var index = 0

    for i in 0..<input.count {
        stack[index] = input[i]
        index += 1
        
        if index < bomb.count {
            continue
        }
        
        if input[i] == bomb.last! {
            var result = true
            for j in 0...bombIndex {
                if stack[index-j-1] != bomb[bombIndex-j] {
                    result = false
                    break
                }
            }
            
            if result {
                index -= (bombIndex + 1)
            }
        }
    }

    if index == 0 {
        print("FRULA")
    } else {
        for i in 0..<index {
            print(stack[i], terminator: "")
        }
        print()
    }
}

//baekjoon9935()
