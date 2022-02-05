import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var total:Int64 = 0
    
    for i in 1...count {
        total += Int64(price * i)
    }
    
    return max(total - Int64(money), 0)
}

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int{
    return max((count + 1) * count / 2 * price - money , 0)
}
