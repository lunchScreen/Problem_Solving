import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = skill_trees.count
    
    for skillTree in skill_trees {
        var skill = skill.map { String($0) }
        let sa = skillTree.map { String($0) }
        for s in sa {
            if skill.contains(s) && skill[0] != s {
                answer -= 1
                break
            } else if skill.contains(s) && skill[0] == s {
                skill.removeFirst()
            }
        }
    }
    
    return answer
}
