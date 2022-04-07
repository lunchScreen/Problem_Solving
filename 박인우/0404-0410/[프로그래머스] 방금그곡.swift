func solution(_ m:String, _ musicinfos:[String]) -> String {    
    func change(_ melody: String) -> String {
        var melody = melody
        melody = melody.replacingOccurrences(of: "A#", with: "a")
        melody = melody.replacingOccurrences(of: "C#", with: "c")
        melody = melody.replacingOccurrences(of: "D#", with: "d")
        melody = melody.replacingOccurrences(of: "F#", with: "f")
        melody = melody.replacingOccurrences(of: "G#", with: "g")
        return melody
    }
    
    var neo = Array(m)
    var answer = "(None)"
    var answerTime = 0
    
    for mi in musicinfos {
        var musicinfo = mi.components(separatedBy: ",")
        var st = musicinfo[0].components(separatedBy: ":")
        var et = musicinfo[1].components(separatedBy: ":")
        var sh = Int(st[0])!
        var sm = Int(st[1])!
        var eh = Int(et[0])!
        var em = Int(et[1])!
        var music = change(musicinfo[3]).map {
            String($0)
        }
        var time = eh*60 + em - sh*60 - sm
        var idx = 0
        var line = ""
        
        for _ in 0..<time {
            line += music[idx]
            idx = (idx + 1) % music.count
        }
        
        if line.contains(change(m)) && answerTime < time {
            answer = musicinfo[2]
            answerTime = time
        }
    }
    
    return answer
}
