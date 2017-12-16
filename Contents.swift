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
