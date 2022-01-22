import Foundation
extension Double {
    func isInteger() -> Bool {
        return Double(floor(self)) == Double(self)
    }
}
func fs(_ num: Double) -> Int {
    if sqrt(num).isInteger() { return 1 }
    let a: Int = Int(sqrt(num))
    for i in 0...a where sqrt(num-Double(i*i)).isInteger() { return 2 }
    for i in 0...a {
        for j in 0...Int(sqrt(num-Double(i*i))) where sqrt(num-Double(i*i+j*j)).isInteger() {
            return 3
        }
    }
    return 4
}
print(fs(Double(readLine()!)!))
