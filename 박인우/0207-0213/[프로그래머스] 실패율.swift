func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var rate = [Int:Float]()
    let dic = stages.reduce(into: [Int:Int]()) { $0[$1, default: 0] += 1 }

    for n in 1...N {
        rate[n] = Float(dic[n] ?? 0) / Float(dic.filter { n < $0.key }.map { $0.value }.reduce(0, +))
    }

    return rate.sorted(by: <).sorted { $0.value > $1.value }.map { $0.key }
}
