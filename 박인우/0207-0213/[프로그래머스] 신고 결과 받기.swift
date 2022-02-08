import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var ed:[String: Set<String>] = [:]
    var ing:[String: Set<String>] = [:]
    
    for id in id_list {
        ed[id] = []
        ing[id] = []
    }
    
    for r in report {
        let people = r.components(separatedBy: " ")
        ing[people[0]]!.insert(people[1])
        ed[people[1]]!.insert(people[0])
    }
    
    return id_list.map {
        ing[$0]!.filter {
            ed[$0]!.count >= k
        }.count
    }
}
