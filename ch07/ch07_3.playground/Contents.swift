class Animal {
	var name:String
	var age:Int
	var numberOfLegs:Int
 
	init(name:String, age:Int, numberOfLegs:Int) {
		self.name = name
		self.age = age
		self.numberOfLegs = numberOfLegs
	}
}

extension Animal {
	func have4Legs() -> Bool {
		return numberOfLegs == 4
	}
}



func swapInt(inout a:Int, inout b:Int) {
	let temp = a
	a = b
	b = temp
}


var a = 1
var b = 2
print("\(a), \(b)")
swapInt(&a, b:&b)
print("\(a), \(b)")


func swapT<T>(inout a:T, inout b:T) {
	let temp = a
	a = b
	b = temp
}

var s1:String = "ABC"
var s2:String = "abc"

swapT(&s1, b:&s2)
