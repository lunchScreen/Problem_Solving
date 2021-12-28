import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let priority = hand == "left" ? 0 : 1
    var position = [10, 12]
    var answer = ""
    numbers.map() {$0 != 0 ? $0 : 11}.forEach() { num in
        switch num%3 {
        case 1 :
            position[0] = num
            answer += "L"
        case 0 :
            position[1] = num
            answer += "R"
        default :
            let pos = closer(num, position[0], position[1], priority)
            position[pos] = num
            answer += pos == 0 ? "L" : "R"
        }
    }
    return answer
}

func closer(_ num: Int, _ a: Int, _ b: Int, _ d: Int) -> Int {
    let distance = (abs((num-1)/3-(a-1)/3)+abs((num-1)%3-(a-1)%3), abs((num-1)/3-(b-1)/3)+abs((num-1)%3-(b-1)%3))
    if distance.0 > distance.1 { return 1 }
    else if distance.0 < distance.1 { return 0 }
    else { return d }
}
