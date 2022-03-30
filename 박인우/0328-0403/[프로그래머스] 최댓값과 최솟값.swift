func solution(_ s:String) -> String {
    var a = s.components(separatedBy: " ").compactMap{
        Int($0)
    }
    return "\(a.min()!) \(a.max()!)"
}
