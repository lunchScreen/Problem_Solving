func solution(_ n:Int64) -> [Int] {
    return String(n).reversed().compactMap({Int(String($0))})
}

func solution(_ n:Int64) -> [Int] {
    return  "\(n)".compactMap { $0.wholeNumberValue }.reversed()
}
