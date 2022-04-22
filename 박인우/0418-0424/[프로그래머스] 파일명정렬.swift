func solution(_ files:[String]) -> [String] {
    let result: [[String]] = files.map {
        Array($0)
    }.map { file in
        var head: [String] = []
        var number: [String] = []
        var tail: [String] = []
        var i = 0
               
        while i < file.count {
            if file[i].isNumber { break }
            head.append(String(file[i]))
            i += 1
        }
        
        var count = 0
        while i < file.count {
            if !file[i].isNumber { break }
            if count == 5 { break }
            number.append(String(file[i]))
            count += 1
            i += 1
        }
               
        while i < file.count {
            tail.append(String(file[i]))
            i += 1
        }
               
        return [head.joined(), number.joined(), tail.joined()]
    }.sorted(by: {
        Int($0[1])! < Int($1[1])!
    }).sorted(by: {
        $0[0].lowercased() < $1[0].lowercased()
    })
    
    return result.map {
        $0.joined()
    }
}
