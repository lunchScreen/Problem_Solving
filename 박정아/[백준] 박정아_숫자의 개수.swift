import Foundation

func solution() {
    var numberMap = [ 0 : 0, 1 : 0, 2 : 0, 3 : 0, 4 : 0, 5 : 0, 6 : 0, 7 : 0, 8 : 0, 9 : 0 ]
    var number = 0
    
    for i in 0..<3 {
        let input = Int(readLine() ?? "") ?? 0
        if i == 0 {
            number = input
            continue
        }
        number *= input
    }
    
    Array(String(number)).flatMap{ Int(String($0)) }.forEach { number in
        numberMap[number]? += 1
    }
    
    numberMap.sorted{ $0.0 < $1.0 }.forEach { number in
        print(number.value)
    }
}

solution()

