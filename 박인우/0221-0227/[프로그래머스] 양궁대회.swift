import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var max_diff:Int = 0
    var max_lst:[Int] = []    
    var dfs = [(0,0,0,0,Array(repeating: 0, count:11))]

    while dfs.count > 0 {
        var now = dfs.removeLast()
        let ascore = now.0
        let lscore = now.1
        let idx = now.2
        let cnt = now.3
        var lst = now.4

        if cnt > n {
            continue    
        }

        if idx > 10 {
            let diff = lscore - ascore
            if diff > max_diff {
                lst[10] = n - cnt
                max_lst = lst
                max_diff = diff
            }
            continue
        }

        if info[10-idx] > 0 {
            dfs.append((ascore+idx, lscore, idx+1, cnt, lst))
        } else {
            dfs.append((ascore, lscore, idx+1, cnt, lst))
        }

        if cnt < n {
            let temp = lst[10-idx]
            lst[10-idx] = info[10-idx] + 1
            dfs.append((ascore, lscore+idx, idx+1, cnt+info[10-idx]+1, lst))
            lst[10-idx] = temp
        }
    }    

    return max_diff == 0 ? [-1] : max_lst
}
