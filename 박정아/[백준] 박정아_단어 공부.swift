func solution() {
    let input = Array(readLine() ?? "").map{ String($0).uppercased() }
    var dic = [String : Int]()
    
    input.forEach { char in
        if dic[char] == nil {
            dic[char] = 1
            return
        }
        dic[char]? += 1
    }
    
    let sortedDic = dic.sorted{ $0.1 > $1.1 }

    if 1 < sortedDic.count && sortedDic[0].value == sortedDic[1].value {
        print("?")
        return
    }
    
    print(sortedDic.first!.key)
}

solution()
