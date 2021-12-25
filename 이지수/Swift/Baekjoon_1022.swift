import Foundation

func lefttop(_ n:Int) -> Int { Int(pow(Double((n*2)+1), 2))-4*n }
func rightbottom(_ n:Int) -> Int { Int(pow(Double((n*2)+1), 2)) } 
func loc(_ a: Int, _ b: Int) -> Int {
    let m: Int = [abs(a), abs(b)].max()!
    switch (a, b) {
        case (-m, _), (_, -m): return lefttop(m)+a-b
        case (m, _): return rightbottom(m)-m+b
        case (_, m): return rightbottom(m-1)+m-a
        default: return 10
    }
}

let input = readLine()!.split(separator: " ").map(){Int($0)!}
let max = Int(log10(Double([loc(input[0], input[1]), loc(input[2], input[3]), loc(input[2], input[1]), loc(input[0], input[3])].max()!)))+1
[Int](input[0]...input[2]).forEach() { r in
    [Int](input[1]...input[3]).forEach() { c in
        print(String(format: "%\(max)d", loc(r, c)), terminator: " ")
    }
    print("")
}
