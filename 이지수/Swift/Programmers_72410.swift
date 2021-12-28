import Foundation

func solution(_ new_id:String) -> String {
    var aAnswer = Array(new_id.lowercased.replace("[^a-z0-9-_.]", "").replace("[.]+", "."))
    if aAnswer.first == "." { aAnswer.removeFirst() }
    if aAnswer.last == "." { aAnswer.removeLast() }
    if aAnswer.count == 0 {aAnswer.append("a")}
    if aAnswer.count > 15 {aAnswer.removeLast(aAnswer[14] != "." ? aAnswer.count-15 : aAnswer.count-14)}
    if aAnswer.count < 3 {aAnswer += Array(repeating: aAnswer.last!, count: 3-aAnswer.count)}
    return aAnswer.reduce(""){"\($0)\($1)"}
}

extension String {
    func replace(_ pattern: String, _ char: String) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
        let range = NSMakeRange(0, self.count)
        return regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: char)
    }
}
