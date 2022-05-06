import Foundation

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    // 인기동영상에 공익광고 삽입
    // 재생기록구간
    // 광고는 동시에 재생되는 형태로 제공
    var timeInfo = [[Int]]()
    let play = play_time.components(separatedBy: ":")
    let adv = adv_time.components(separatedBy: ":")
    let playTime = 3600*Int(play[0])! + 60*Int(play[1])! + Int(play[2])!
    let advTime = 3600*Int(adv[0])! + 60*Int(adv[1])! + Int(adv[2])!
    
    // 시작시간과 종료시간 짝지어서 기록
    for log in logs {
        let time = log.components(separatedBy: "-")
        let startStr = time[0]
        let endStr = time[1]
        
        let start = startStr.components(separatedBy: ":")
        let end = endStr.components(separatedBy: ":")
        
        let startTime = 3600*Int(start[0])! + 60*Int(start[1])! + Int(start[2])!
        let endTime = 3600*Int(end[0])! + 60*Int(end[1])! + Int(end[2])!
        
        timeInfo.append([startTime, endTime])
    }
    
    var arr = Array(repeating: 0, count: playTime+1)
    for time in timeInfo {
        arr[time[0]] += 1
        arr[time[1]] -= 1
    }
    
    for t in 1...playTime {
        arr[t] = arr[t] + arr[t-1]
    }
    
    for t in 1...playTime {
        arr[t] = arr[t] + arr[t-1]
    }    
    
    var maxCount = arr[advTime] - arr[0]
    var maxTime = 0
    
    for t in 0...playTime-advTime {
        if maxCount < arr[t+advTime] - arr[t] {
            maxCount = arr[t+advTime] - arr[t]
            maxTime = t + 1
        }
    }
    
    return "\(String(format: "%02d",maxTime/3600)):\(String(format: "%02d",(maxTime%3600)/60)):\(String(format: "%02d",(maxTime%3600)%60))"
}
