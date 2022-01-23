import Foundation

func solution(_ places:[[String]]) -> [Int] {
    var answer: [Int] = []
    
    for place in places {
        let place = place.map{ Array($0) }
        var distancing = true
        
        for i in 0..<5 {
            for j in 0..<5 {
                if place[i][j] == "P" {
                    if i - 1 >= 0 {
                        if place[i - 1][j] == "P" {
                            distancing = false
                            break
                        }
                        if place[i - 1][j] == "O" {
                            if i - 2 >= 0 && place[i - 2][j] == "P" {
                                distancing = false
                                break
                            }
                            if j - 1 >= 0 && place[i - 1][j - 1] == "P" {
                                distancing = false
                                break
                            }
                            if j + 1 < 5 && place[i - 1][j + 1] == "P" {
                                distancing = false
                                break
                            }
                        }
                    }
        
                    if i + 1 < 5 {
                        if place[i + 1][j] == "P" {
                            distancing = false
                            break
                        }
                        if place[i + 1][j] == "O" {
                            if i + 2 < 5 && place[i + 2][j] == "P" {
                                distancing = false
                                break
                            }
                            if j - 1 >= 0 && place[i + 1][j - 1] == "P" {
                                distancing = false
                                break
                            }
                            if j + 1 < 5 && place[i + 1][j + 1] == "P" {
                                distancing = false
                                break
                            }
                        }
                    }
                    
                    if j + 1 < 5 {
                        if place[i][j + 1] == "P" {
                            distancing = false
                            break
                        }
                        if place[i][j + 1] == "O" {
                            if j + 2 < 5 && place[i][j + 2] == "P" {
                                distancing = false
                                break
                            }
                            if i - 1 >= 0 && place[i - 1][j + 1] == "P" {
                                distancing = false
                                break
                            }
                            if i + 1 < 5 && place[i + 1][j + 1] == "P" {
                                distancing = false
                                break
                            }
                        }
                    }
                }
            }
        }
        
        if distancing {
            answer.append(1)
        } else {
            answer.append(0)
        }
    }
    
    return answer
}

