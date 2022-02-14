func solution(_ str1:String, _ str2:String) -> Int {
    // 자카드 유사도 = 교집합크기 / 합집합크기
    // 둘 다 공집합일 경우 그냥 1로
    // 다중집합에 대해서도 계산가능 (교집합은 min 개수, 합집합은 max 개수)
    // 문자열은 두글자씩 끊어서 (0~1, 1~2, 2~3, ...)
    // 영문자쌍만 인정, 공백이나 다른문자 포함된 쌍은 버림
    // 대소문자 차이는 무시함
    
    var dic1 = [String:Int]()
    var dic2 = [String:Int]()
    
    var idx = str1.startIndex
    
    while idx != str1.index(before: str1.endIndex) {
        let nxtIdx = str1.index(after: idx)
        if str1[idx].isLetter && str1[nxtIdx].isLetter {
            dic1[str1[idx...nxtIdx].lowercased(), default: 0] += 1
        }
        idx = nxtIdx        
    }
    
    idx = str2.startIndex
    
    while idx != str2.index(before: str2.endIndex) {
        let nxtIdx = str2.index(after: idx)
        if str2[idx].isLetter && str2[nxtIdx].isLetter {
            dic2[str2[idx...nxtIdx].lowercased(), default: 0] += 1
        }
        idx = nxtIdx        
    }
    
    if dic1.count == 0 && dic2.count == 0 {
        return 65536
    }
    
    var inter = 0
    var union = 0
    
    for (key, v1) in dic1 {
        if let v2 = dic2[key] {
            inter += min(v1,v2)
            union += max(v1,v2)
            continue
        } 
        union += v1
    }
    
    for (key, v2) in dic2 {
        if let v1 = dic1[key] {
            continue
        }
        union += v2
    }
    
    return Int(Float(inter) * 65536 / Float(union))
}
