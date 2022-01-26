func solution(_ arr:[Int]) -> [Int] {
    let min = arr.sorted(by: <)[0]
    return arr.count == 1 ? [-1] : arr.compactMap({ return $0 != min ? $0 : nil })
}
