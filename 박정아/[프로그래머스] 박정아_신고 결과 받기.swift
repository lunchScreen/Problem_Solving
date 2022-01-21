import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var idList = [String : Int]()
    var reportList = [String : Set<String>]()
    var answer = Array(repeating: 0, count: id_list.count)
    
    id_list.enumerated().forEach { index, id in
        idList[id] = index
    }

    report.forEach { reportInfo in
        let reportInfo = reportInfo.components(separatedBy: " ")
        if reportList[reportInfo[1]] == nil {
            reportList[reportInfo[1]] = [reportInfo[0]]
            return
        }
        reportList[reportInfo[1]]?.insert(reportInfo[0])
    }

    reportList.filter{ $0.value.count >= k }.forEach { list in
        list.value.forEach { id in
            if let index = idList[id] {
                answer[index] += 1
            }
        }
    }

    return answer
}
