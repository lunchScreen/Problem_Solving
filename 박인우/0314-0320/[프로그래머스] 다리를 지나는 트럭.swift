import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {    
    var time = 0
    var bridge = Array(repeating: 0, count: bridge_length)
    var trucks = truck_weights
    var w = 0
    
    while !bridge.isEmpty {
        w -= bridge.removeFirst()
        time += 1
        
        if bridge.count < bridge_length {
            if let t = trucks.first {
                if t + w <= weight {
                    w += trucks.removeFirst()
                    bridge.append(t)
                } else {
                    bridge.append(0)
                }
            }
        }
    }
    
    return time 
}
