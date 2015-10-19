import Cocoa

class Vector {
	var x:Double = 0
	
	var y:Double = 0
	
	var len:Double {
		get {
			return sqrt(x * x + y * y)
		}
		set(newLen) {
			let ratio = newLen / len
			x *= ratio
			y *= ratio
		}
	}
}

var a:Vector = Vector()

a.x = 3
a.y = 4

print(" vector length = \(a.len)")

a.len = 3

print(" new vector = (\(a.x), \(a.y))")


struct Employee {
	var name:String
	let empNo:String
}

var emp1 = Employee(name:"이동수", empNo:"11111")

emp1.name = "이동우"
//emp1.empNo = "11565"	// error

let emp2 = Employee(name:"오진석", empNo:"11112")

//emp2.name = "오진식"		// error


class Person {
	var name:String = String()
	var weight:Int = 0 {
		willSet {
			print("weight will be set to \(newValue).")
		}
		didSet {
			print("weight is changed from \(oldValue).")
		}
	}
}

var person:Person = Person()
person.name = "홍길동"
person.weight = 70

class Math {
	class var PI:Double { return 3.14 }
}

struct Physics {
	static let C:Int = 299_792_458
	static var ZERO:Double { return -273.15 }
}

enum Week {
	case SUN, MON, TUE, WED, THU, FRI, SAT
	static let daysOfWeek:Int = 7
	static var weeksOfYear:Int { return 365/daysOfWeek }
}
