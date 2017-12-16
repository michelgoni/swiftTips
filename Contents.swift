//: Playground - noun: a place where people can play

import UIKit

//Unwapping in one line
var content = "text"
var url = URL(string: content)!

content = (try? String(contentsOf: url)) ?? "Default content"

//Outerloop
outerLoop: for i in 1...10 {
    
    print(i)
    if i == 7 {
        break
    }
}

//Defer label statements

struct SavedData: Codable {
    
}

func reloadUI () {
    
}

loadfromJson: do {
    
    defer {reloadUI()}// No matter when block ends, we sneure that reloadUI will execute
    let decoder = JSONDecoder()
    guard let url = Bundle.main.url(forResource: "Data", withExtension: "json") else { break loadfromJson}
    guard let contents = try? Data(contentsOf: url) else {break loadfromJson}
    guard let decoded = try? decoder.decode(SavedData.self, from: contents) else { break loadfromJson}
    print(decoded)
}

//KVO: for free in many UIKit elements
let view = UIView()
view.observe(\.isHidden, options: .new) { viewFromBlock, change in
    print(change.newValue!)
}

view.isHidden = true
view.isHidden = false
