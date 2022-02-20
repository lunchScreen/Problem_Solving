import Foundation

let input = readLine()!.split(separator: " ").map(){Int(String($0))!}

func bfs(_ A: Int, _ B: Int, _ C: Int) -> [Int] {
    var visit = Array<[[Bool]]>(repeating: Array<[Bool]>(repeating: Array<Bool>(repeating: false, count: C+1), count: B+1),count: A+1)
    var queue = [(0, 0, C)]
    while !queue.isEmpty {
        let node = queue.removeFirst()
        let a = node.0; let b = node.1; let c = node.2
        if visit[a][b][c] { continue }
        visit[a][b][c] = true
        if a > 0 {
            if a >= B-b { queue.append((a-B+b, B, c)) }
            else { queue.append((0, b+a, c))}
            if a >= C-c { queue.append((a-C+c, b, C)) }
            else { queue.append((0, b, c+a))}
        }
        if b > 0 {
            if b >= A-a { queue.append((A, b-A+a, c)) }
            else { queue.append((a+b, 0, c))}
            if b >= C-c { queue.append((a, b-C+c, C)) }
            else { queue.append((a, 0, c+b))}
        }
        if c > 0 {
            if c >= B-b { queue.append((a, B, c-B+b)) }
            else { queue.append((a, b+c, 0))}
            if c >= A-a { queue.append((A, b, c-A+a)) }
            else { queue.append((a+c, b, 0))}
        }
    }
    var result = Set<Int>()
    for b in 0..<B+1 {
        for c in 0..<C+1 where visit[0][b][c] {
            result.insert(c)
        }
    }
    return Array(result).sorted()
}

bfs(input[0], input[1], input[2]).forEach() {print($0, terminator: " ")}
