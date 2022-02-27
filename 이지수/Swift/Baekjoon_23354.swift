import Foundation

struct Coordinate {
    let x: Int
    let y: Int
    func movableLocation(_ N: Int) -> [Self] {
        return [Coordinate(x: self.x-1, y: self.y), Coordinate(x: self.x+1, y: self.y), Coordinate(x: self.x, y: self.y-1), Coordinate(x: self.x, y: self.y+1)].filter() {
            0..<N ~= $0.x && 0..<N ~= $0.y
        }
    }
} 

struct MinHeap<T: Comparable> {
    private var elements: [T] = []
    init(elements: [T]) {
        for e in elements { self.insert(e) }
    }
    var count: Int {
        return self.elements.count
    }
    private var lastIndex: Int {
        return self.count - 1
    }
    private func rightChild(of index: Int) -> Int? {
        guard index*2+2 < self.count else { return nil }
        return index*2+2
    }
    private func leftChild(of index: Int) -> Int? {
        guard index*2+1 < self.count else { return nil }
        return index*2+1
    }
    private func parent(of index: Int) -> Int? {
        guard index > 0 else { return nil }
        return (index-1)/2
    }
    private mutating func swap(_ index1: Int, _ index2: Int) {
        let temp = self.elements[index1]
        self.elements[index1] = self.elements[index2]
        self.elements[index2] = temp
    }
    func node(of index: Int) -> T {
        return self.elements[index]
    }
    mutating func insert(_ node: T) {
        self.elements.append(node)
        var child = self.lastIndex
        while let parents = parent(of: child),
            self.elements[parents] > node {
            swap(parents, child)
            child = parents
        }
    }
    mutating func delete() {
        swap(self.lastIndex, 0)
        self.elements.remove(at: self.lastIndex)
        var current = 0
        var lChild = leftChild(of: current)
        var rChild = rightChild(of: current)
        while current < self.count, 
        self.elements[current] > self.elements[lChild ?? current] || self.elements[current] > self.elements[rChild ?? current] {
            if let lChild = lChild,
            let rChild = rChild {
                if self.elements[lChild] < self.elements[rChild] {
                    swap(current, lChild)
                    current = lChild
                } else {
                    swap(current, rChild)
                    current = rChild
                }
            } else if let lChild = lChild {
                swap(current, lChild)
                current = lChild
            } else if let rChild = rChild {
                swap(current, rChild)
                current = rChild
            } else { break }
            lChild = leftChild(of: current)
            rChild = rightChild(of: current)
        }
    }
    mutating func pop() -> T {
        let removeElement = self.elements[0]
        self.delete()
        return removeElement
    }
}

struct Node: Comparable {
    var element: Int
    var coordinate: Coordinate
    static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.element < rhs.element
    }
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.element == rhs.element && lhs.coordinate.x == rhs.coordinate.x && lhs.coordinate.y == rhs.coordinate.y
    }
}

func dijkstra(_ N: Int, s: Coordinate, graph: [[Int]]) -> [[Int]] {
    var queue = MinHeap<Node>(elements: [Node(element: graph[s.x][s.y], coordinate: s)])
    var dists = Array<[Int]>(repeating: Array<Int>(repeating: Int.max, count: N), count: N)
    while queue.count > 0 {
        let c = queue.pop()
        let curDist = c.element
        let curLoc = c.coordinate
        guard dists[curLoc.x][curLoc.y] >= curDist else { continue }
        for nextLoc in curLoc.movableLocation(N) {
            let dist = curDist + graph[nextLoc.x][nextLoc.y]
            if dist < dists[nextLoc.x][nextLoc.y] {
                dists[nextLoc.x][nextLoc.y] = dist
                queue.insert(Node(element: dist, coordinate: nextLoc))
            }
        }
    }
    return dists
} 

func permutation<T>(_ elements: [T], _ n : Int) -> [[T]] {
    guard n > 0 else { return [] }
    var result = [[T]]()
    var visited = [Bool](repeating: false, count: elements.count)

    func permute(_ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }
        for i in 0..<elements.count where !visited[i] {
            visited[i] = true
            permute(now+[elements[i]])
            visited[i] = false
        }
    }
    permute([])
    return result
}

func minDist(_ N: Int, start: Coordinate, graph: [[Int]], deserters: [Coordinate]) -> Int {
    guard !deserters.isEmpty else { return 0 }
    var minDist = Int.max
    var dists = Array<[Int]>(repeating: Array<Int>(repeating: Int.max, count: deserters.count+1), count: deserters.count+1)
    dists[0][0] = 0
    for i in 1...deserters.count {
        let idist = dijkstra(N, s: deserters[i-1], graph: graph)
        dists[i][0] = idist[start.x][start.y]
        dists[0][i] = dists[i][0]
        for j in 0..<deserters.count {
            dists[i][j+1] = idist[deserters[j].x][deserters[j].y]
            dists[j+1][i] = dists[i][j+1]
        }
    }
    for order in permutation(Array(1...deserters.count), deserters.count) {
        var dist = 0
        var current = 0
        for dest in order {
            dist += dists[current][dest]
            current = dest
        }
        dist += dists[current][0]
        minDist = min(dist, minDist)
    }
    return minDist
}

let N = Int(readLine()!)!
var graph = Array<[Int]>()
var unit: Coordinate? = nil
var deserters: [Coordinate] = []
for i in 0..<N {
    graph.append(readLine()!.split(separator: " ").map() { Int(String($0))! })
    for j in 0..<N {
        switch graph[i][j] {
        case -1:
            graph[i][j] = 0
            unit = Coordinate(x: i, y: j)
        case 0:
            deserters.append(Coordinate(x: i, y: j))
        default: continue
        }
    }
}
print(minDist(N, start: unit!, graph: graph, deserters: deserters))
