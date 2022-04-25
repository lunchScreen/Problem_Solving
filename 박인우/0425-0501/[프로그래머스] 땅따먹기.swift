import Foundation

func solution(_ land:[[Int]]) -> Int{
    var memoLand = land
    
    for i in 1..<land.count {
        memoLand[i][0] = max(memoLand[i-1][1],memoLand[i-1][2], memoLand[i-1][3]) + memoLand[i][0]
        memoLand[i][1] = max(memoLand[i-1][0],memoLand[i-1][2], memoLand[i-1][3]) + memoLand[i][1]
        memoLand[i][2] = max(memoLand[i-1][0],memoLand[i-1][1], memoLand[i-1][3]) + memoLand[i][2]
        memoLand[i][3] = max(memoLand[i-1][0],memoLand[i-1][1], memoLand[i-1][2]) + memoLand[i][3]
    }
    
    return memoLand.last!.max()!
}
