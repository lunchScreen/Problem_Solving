import Foundation

@inline(__always)
func start(n: Int, m: Int) {
    var knownList: [Int] = readLine()!.components(separatedBy: " ").map(){Int($0)!}; knownList.removeFirst()
    var partyList: [[Int]] = []
    for _ in 0..<m { 
        var p = readLine()!.components(separatedBy: " ").map(){Int($0)!}; p.removeFirst()
        partyList.append(p)
    }
    print(countAvailableParty(partyList, with: unknownList(knownList: knownList, tree: tree(partyList: partyList, knownList: knownList), total: n), total: m))
}

@inline(__always)
func tree(partyList: [[Int]], knownList: [Int]) -> [Int: [Int]] {
    var tree = [0: knownList]
    for party in partyList {
        for person in party {
            tree[person] = Array(Set((tree[person] ?? []) + party))
        }
    }
    return tree
}

@inline(__always)
func unknownList(knownList: [Int], tree: [Int: [Int]], total: Int) -> [Int] {
    var visited = Array<Bool>(repeating: false, count: total + 1)
    var queue: [Int] = tree[0]!
    while !queue.isEmpty {
        let index = queue.removeFirst()
        if visited[index] { continue }
        visited[index] = true
        queue += (tree[index] ?? [])
    }
    var unknownList: [Int] = visited.enumerated().filter{!$1}.map() {index, visited in index}; unknownList.removeFirst()
    return unknownList
}

@inline(__always)
func countAvailableParty(_ partyList: [[Int]], with unknownList: [Int], total: Int) -> Int {
    var count = total
    for party in partyList {
        for p in party where !(unknownList.contains(p)) {
            count -= 1; break
        }
    }
    return count
}

let input: [Int] = readLine()!.components(separatedBy: " ").map(){Int($0)!}
start(n: input[0], m: input[1])
