import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var a = a
    var b = b
    var count = 0
    while a != b {
        a = (a+1) / 2
        b = (b+1) / 2
        count += 1
    } 

    return count
}
