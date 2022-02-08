import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var answer = ""
    
    let phoneNumber = [
        "1":(0, 0),"2":(0, 1),"3":(0, 2),
        "4":(1, 0),"5":(1, 1),"6":(1, 2),
        "7":(2, 0),"8":(2, 1),"9":(2, 2),
        "*":(3, 0),"0":(3, 1),"#":(3, 2)
    ]
    
    var r = (3, 0)
    var l = (3, 2)
    
    for n in numbers {
        if n == 1 || n == 4 || n == 7 {
            answer += "L"
            l = phoneNumber[String(n)]!
            continue
        } else if n == 3 || n == 6 || n == 9 {
            answer += "R"
            r = phoneNumber[String(n)]!
            continue
        } 
        
        var rd = abs(phoneNumber[String(n)]!.0 - r.0) + abs(phoneNumber[String(n)]!.1 - r.1)
        var ld = abs(phoneNumber[String(n)]!.0 - l.0) + abs(phoneNumber[String(n)]!.1 - l.1)
        
        if rd < ld {
            answer += "R"
            r = phoneNumber[String(n)]!
        } else if rd > ld {
            answer += "L"
            l = phoneNumber[String(n)]!
        } else {
            if hand == "right" {
                answer += "R"
                r = phoneNumber[String(n)]!
            } else {
                answer += "L"
                l = phoneNumber[String(n)]!
            }
        }
    }
    
    return answer
}
