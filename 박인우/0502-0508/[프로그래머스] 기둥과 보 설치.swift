import Foundation

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {    
    // n : 벽면크기
    // build_frame : 기둥과 보 설치 및 삭제작업
    // a : 0 기둥 1 보
    // b : 0 삭제 1 설치
    var state = Array(repeating: Array(repeating: [false,false], count: n+1), count: n+1)
    
    func columnCheck(_ x: Int, _ y: Int) -> Bool {
        if y == 0 {
            return true               
        } else if (x-1 >= 0 && state[y][x-1][1]) || state[y][x][1] {
            return true
        } else if state[y-1][x][0] {
            return true
        }        
        return false
    }
    
    func rowCheck(_ x: Int, _ y: Int) -> Bool {
        if state[y-1][x][0] || (x+1 <= n && state[y-1][x+1][0]) {
            return true
        } else if (x-1 >= 0 && state[y][x-1][1]) && 
        (x+1 <= n && state[y][x+1][1]) {
            return true
        }
        return false
    }
    
    for build in build_frame {
        let x = build[0]
        let y = build[1]
        let a = build[2]
        let b = build[3]
        
        if a == 0 && b == 1 { // 기둥설치
            if columnCheck(x,y) {
                state[y][x][0] = true
            }
        } else if a == 0 && b == 0 { // 기둥삭제
            state[y][x][0] = false
            if (y+1 <= n && state[y+1][x][1] && !rowCheck(x,y+1)) ||
            (y+1 <= n && x-1 >= 0 && state[y+1][x-1][1] && !rowCheck(x-1,y+1)) ||
            (y+1 <= n && state[y+1][x][0] && !columnCheck(x,y+1)) {
                state[y][x][0] = true
            }             
        } else if a == 1 && b == 1 { // 보설치
            if rowCheck(x, y) {
                state[y][x][1] = true
            }
        } else if a == 1 && b == 0 { // 보삭제
            state[y][x][1] = false
            if (state[y][x][0] && !columnCheck(x,y)) ||
            (x+1 <= n && state[y][x+1][0] && !columnCheck(x+1,y)) ||
            (x-1 >= 0 && state[y][x-1][1] && !rowCheck(x-1,y)) ||
            (x+1 <= n && state[y][x+1][1] && !rowCheck(x+1,y)) {
                state[y][x][1] = true
            }            
        }
    }
    
    var result = [[Int]]()
    for x in 0...n {
        for y in 0...n {
            if state[y][x][0] {
                result.append([x,y,0])
            }
            if state[y][x][1] {
                result.append([x,y,1])                
            }
        }
    }
    return result
}
