import Foundation

func solution() {
    while let input = readLine() {
        if input == "." {
            break
        }
        
        let input = input.map{ String($0) }
        var stack = [String]()
        
        for c in input {
            if c == "(" || c == "[" {
                stack.append(c)
            } else if c == ")" {
                if stack.last == "(" {
                    stack.removeLast()
                    continue
                }
                print("no")
                break
            } else if c == "]" {
                if stack.last == "[" {
                    stack.removeLast()
                    continue
                }
                print("no")
                break
            } else if c == "." {
                if stack.isEmpty {
                    print("yes")
                    break
                }
                print("no")
            }
        }
    }
}

solution()

