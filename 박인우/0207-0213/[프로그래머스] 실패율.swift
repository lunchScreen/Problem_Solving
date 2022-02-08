import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var stop: [Double] = Array(repeating: 0, count: N+1)
    
    for stage in stages {
        stop[stage-1] += 1
    }
    
    var arrival = (0...N-1).map { 
        stop[$0...N].reduce(Double(0),+)
    }
    
    var failure = zip(stop,arrival).map {
        $1 > 0 ? $0 / $1 : $0
    }.enumerated().sorted {
        $0.element > $1.element
    }.map {
        $0.offset + 1
    }
    
    return failure
}

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var rate = [Int:Float]()
    let dic = stages.reduce(into: [Int:Int]()) { $0[$1, default: 0] += 1 }

    for n in 1...N {
        rate[n] = Float(dic[n] ?? 0) / Float(dic.filter { n < $0.key }.map { $0.value }.reduce(0, +))
    }

    return rate.sorted(by: <).sorted { $0.value > $1.value }.map { $0.key }
}
