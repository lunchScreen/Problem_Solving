func solution(_ gems:[String]) -> [Int] {
    
    var start = 0
    var end = 0
    let totalCount = Set(gems).count
    var gemBox = [String:Int]()
    var answer = [1, gems.count]
    
    while end < gems.count {   
        
        gemBox[gems[end], default: 0] += 1 
        
        while start <= end && gemBox[gems[start]]! > 1 {
            gemBox[gems[start]]! -= 1
            start += 1
        }         
        
        let nowCount = gemBox.count
        
        if totalCount == nowCount &&
        answer[1] - answer[0] > end - start {
            answer = [start+1, end+1]
        } 
        
        end += 1
    }
    
    return answer
}
