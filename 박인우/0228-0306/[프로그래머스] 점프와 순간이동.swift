import Foundation

func solution(_ n:Int) -> Int 
{
    var n = n
    var cnt = 0
    
    while n > 0 {
        cnt += n % 2
        n = n / 2
    }
    
    return cnt
}
