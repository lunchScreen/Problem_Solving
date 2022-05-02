func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {    
    var busList = Array(repeating: [Int](), count: n)
    
    let timetalbe: [Int] = timetable.map {
        let time = $0.components(separatedBy: ":")
        let mt = Int(time[0])!*60 + Int(time[1])!
        return mt
    }
    
    for mt in timetalbe.sorted() {
        var pick = (mt - 540) <= 0 ? 0 : (mt - 541) / t + 1
        while pick < n && busList[pick].count >= m { pick += 1 }
        if pick < n { busList[pick].append(mt) }
    }
    
    var time = t*(n-1) + 540
    while busList[n-1].count >= m {
        time = busList[n-1].removeLast()-1
    }
    
    return "\(String(format: "%02d", time / 60)):\(String(format: "%02d", time % 60))"
}
