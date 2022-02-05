func solution(_ dartResult:String) -> Int {
    let numberList = dartResult.split(whereSeparator: {$0.isLetter || $0 == "#" || $0 == "*"})
    let letterList = dartResult.split(whereSeparator: {$0.isNumber})

    var totalScore = 0

    for (i, (number, letter)) in zip(numberList, letterList).enumerated() {
        var score = 0
        if let number = Int(number) {
            score = letter.contains("D") ? number * number : letter.contains("T") ? number * number * number : number
        }

        if letter.contains("*") {
            score *= 2
        } else if letter.contains("#") {
            score = -score
        }

        if i != 2 {
            if letterList[i + 1].contains("*") {
                score *= 2
            }
        }
        
        totalScore += score
    }
    
    return totalScore
}
