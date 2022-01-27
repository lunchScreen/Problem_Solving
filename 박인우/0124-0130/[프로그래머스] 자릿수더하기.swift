import Foundation

func solution(_ n:Int) -> Int
{
    return "\(n)".compactMap{ $0.wholeNumberValue }.reduce(0,+)
}
