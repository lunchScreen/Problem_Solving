import Foundation

func solution(_ relation:[[String]]) -> Int {
    // 모든 튜플 중 유일
    // 하나라도 제외했을 때는 유일성이 깨져야함 (하나 제외해도 유일성이 있으면 후보키가 아님)
    // 최대 후보키 개수를 구해보셈
    
    // 1~n개를 골랐을 때의 조합
    // 각 키 조합 찾아서 후보키면 return해버리고 visited 여부 표시
    // 아니면 다른 키 조합 시도 
    
    var visited = Array(repeating: false, count: relation[0].count)
    var answer = 0
    var candidate = [[Int]]()
    
    func dfs(idxList: [Int]) {
        var test = Set<String>()
        
        for tuple in relation {
            test.insert(tuple.enumerated().filter { idx, value in
                return idxList.contains(idx)
            }.reduce("", {
                $0 + $1.element
            }))
        }
        
        if test.count == relation.count {
            candidate.append(idxList)
            idxList.forEach { visited[$0] = true }
            return
        }
        
        for i in idxList.last!..<relation[0].count {
            if !idxList.contains(i) {
                var newIdxList = idxList
                newIdxList.append(i)
                dfs(idxList: newIdxList)
            }
        }
    }
    
    for i in 0..<relation[0].count {
        dfs(idxList: [i])
    }
    
    var test = Set<[Int]>()
    
    candidate.sorted {
        $0.count < $1.count
    }.forEach {
        let bc = test.count
        test.insert($0.sorted())
        if bc != test.count {
            answer += 1
        }
        dfs2(idxList: $0)
    }
    
    func dfs2(idxList: [Int]) {
        test.insert(idxList.sorted())
        for i in 0..<relation[0].count {
            if !idxList.contains(i) {
                var newIdxList = idxList
                newIdxList.append(i)
                dfs2(idxList: newIdxList)
            }
        }
    }
    
    return answer
}

// 무작정 풀어서 코드가 좀 더럽다... 내일 더 좋은 방법 찾아보고 코드정리까지 할 예정ㅎ
