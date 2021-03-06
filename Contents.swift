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

//UItextChecker
extension String {
    var isCorrectlySpelled: Bool {
        
        let checker = UITextChecker()
       
        let mispelledRange = checker.rangeOfMisspelledWord(in: self, range: NSRange(location: 0, length: self.utf16.count), startingAt: 0, wrap: false, language: "en")
        
        return mispelledRange.location == NSNotFound
    }
}
"ter me somesing gud".isCorrectlySpelled

//Conforming ExpressiblebyStringLiteral
extension URL: ExpressibleByStringLiteral {
    
   public init(stringLiteral value: String) {
        self = URL (string: value)!
    }
}
let newUrl: URL = "http://nomorestrngconversion.com"
print(newUrl.absoluteString)


extension Date: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self = formatter.date(from: value)!
    }
}
let newDate: Date = "2015-12-10"
print(newDate)

















