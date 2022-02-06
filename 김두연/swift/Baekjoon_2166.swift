import Foundation

func baekjoon2166() {
    let n = Int(readLine()!)!
    var points = [[Double]]()
    
    for _ in 0..<n {
        points.append(readLine()!.split(separator: " ").map { Double(String($0))! })
    }
    
    var result: Double = 0
    
    for i in 1..<n-1 {
        let area = (points[i][0]-points[0][0])*(points[i+1][1]-points[0][1]) - (points[i][1]-points[0][1])*(points[i+1][0]-points[0][0])
        result += area/2.0
    }
    
    
    print(round(abs(result)*10)/10)
}

//baekjoon2166()
