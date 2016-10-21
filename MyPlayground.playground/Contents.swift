//: Playground - noun: a place where people can play

import UIKit

let str = "Hello, playground"
str[str.startIndex]
let s=10
var str1=str+String(s)
print("this is \(str1)")
UInt64.max
UInt32.max
UInt64.min
Int64.min
4/3
4%3
5/3
5%3
Double(5)/3
(404,"not found")
var l="l2345"
let num=Int(l)

if let n=num{
    print("\(n)")
}else{
    print("not value")
}

assert(num==nil,"ssss")

1...10
for index in 1...100{
 print("\(index)")
}
 //print(index)
str.utf8
str.utf16
//str[1]
//str[3]
var threeString=[String](repeating:"aaa",count:3)
var threeString2=[String](repeating:"b",count:10)
//[String]
threeString+threeString2
for v in (threeString+threeString2){
   print("\(v)")
}

func great(name:String)->String{
    return "hello \(name)";
}

great(name: "zhou")

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
var sor=names.sorted(by: {(s1:String,s2:String)-> Bool in
return s1>s2
})

names.sorted(by: {s1,s2 in return s1>s2})
names.sorted(by: {s1,s2  in s1>s2})

names.sorted(by: {$0>$1})
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

var strings=numbers.map({(number)->String in
   var numb=number
    var output=""
    repeat{
        output+=digitNames[numb%10]!
        numb=numb/10
        
    } while numb>0
    return output
})
print(strings)

enum CompassPoint{
    case north
    case south
    case east
    case west
}

var p=CompassPoint.east
p = .west
p = .north
CompassPoint.east.hashValue
struct Resolution{
    var width=0
    var heitht=0
}

var r1=Resolution(width: 1024, heitht: 768)
var r2=r1
r2.width=2048
r1.width
r2.width

class Counter{
    var count=0
    func increment() {
        count=count+1
    }
    func incrementBy(amount:Int)  {
        count=count+amount
    }
    
    func reset() {
        count=0
    }
    
    //func printC()  {
      //NSLog(" %d", count)
    //}
    func incrementBy(_ amount:Int,_ numberTimes:Int )  {
        count=amount*numberTimes
    }
}

var c=Counter()
c.increment()
//c.printC()
c.incrementBy(amount: 10)
c.count
c.incrementBy( 2,  3)
c.count

struct TimeTable{
    let mulTable:Int
//    private   var _name:String{
//        willSet(newvalue){NSLog("willSet:%@",newvalue)}
//        didSet{NSLog("didSet %@",_name) }
//    }
//    
//    var Name:String{
//        get{return self._name}
//        set{_name=newValue}
//    }
    
    subscript(index:Int)->Int{
        return self.mulTable*index
    }
}

var timeTable=TimeTable(mulTable: 2)
timeTable[5]
print("firstName")


//class  Person:NSObject{
//    var firstName:String{
//        get{return self.firstName}
//        set{self.firstName=newValue}
//    }
//    var lastName:String{
//        get{
//            return self.lastName
//        }
//        set{
//            self.lastName=newValue
//        }
//    }
//    
//    func disc()->String  {
//        return "firstname:(firstName) lastName:(lastName)"
//       //NSLog(" firstName: %@ lastName :%@", firstName,lastName)
//        //<#function body#>
//    }
//}
//
//class Manager:Person{
//    var postName:String{
//        get{
//            return self.postName
//        }
//        set{
//            self.postName=newValue
//        }
//    }
//    
//    override func disc()->String {
//    return  super.disc()+" postName:(postName)";
//        //+" postName:(postName)";
//    }
//}

//var p1=Person()
//p1.firstName="tab"
//p1.lastName=" com"
// NSLog(p1.disc())
//p1.firstName
//p1.lastName
//print(p1.disc())
//
//
//
//var m1=Manager()









