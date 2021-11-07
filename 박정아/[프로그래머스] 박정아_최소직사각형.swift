import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    let sortedSizes = sizes.map{ $0.sorted() }
    return (sortedSizes.map{ $0[0] }.max() ?? -1) * (sortedSizes.map{ $0[1] }.max() ?? -1)
}
