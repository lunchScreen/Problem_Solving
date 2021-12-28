import Foundation

func solution(_ dartResult:String) -> Int {
    let options = dartResult.replace("[0-9]", " ").split(separator: " ").map() {Array($0)}
    var points = dartResult.replace("[^0-9]", " ").split(separator: " ").map() {Int($0)!}
    for (index, (point, option)) in zip(points, options).enumerated(){
        switch option[0] {
        case "D" : points[index] = Int(pow(Double(points[index]), 2))
        case "T" : points[index] = Int(pow(Double(points[index]), 3))
        default : break
        }
        guard option.count > 1 else { continue }
        switch option[1] {
        case "*" :
            points[index] *= 2
            if index != 0 { points[index-1] *= 2}
        default : points[index] *= -1
        }
    }
    return points.reduce(0, +)
}

extension String {
    func replace(_ pattern: String, _ char: String) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
        let range = NSMakeRange(0, self.count)
        return regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: char)
    }
}
