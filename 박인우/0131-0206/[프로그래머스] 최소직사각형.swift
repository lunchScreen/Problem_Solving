import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var width = 0
    var height = 0
    
    for size in sizes {
        var x = size[0] > size[1] ? size[0] : size[1]
        var y = size[0] > size[1] ? size[1] : size[0]
        
        width = max(x, width)
        height = max(y, height)
    }
    
    return width * height
}
