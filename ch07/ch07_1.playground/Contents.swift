class Dog {
	var name:String = ""
	
	init(name:String) {
		self.name = name
	}
}

class Person {
	// ...
	var dog:Dog? = nil
	
	// ...
}

var person1:Person = Person()

print(person1.dog?.name)

person1.dog = Dog(name:"돌쇠")

print(person1.dog?.name)
print((person1.dog?.name)!)


class Class {
	var students:[Person]
	
	subscript(i:Int) -> Person? {
		print("subscript: \(i), \(students.count)")
		if i >= 0 && i < students.count {
			return students[i]
		} else {
			return nil
		}
	}
	
	init() {
		students = [Person]()
		print("init: \(students.count)")
	}
	
	func add(student:Person) {
		print("add: \(students.count)")
		students.append(student)
	}
}

var class1:Class? = Class()
var student1 = Person()
student1.dog = Dog(name:"멍멍이")

class1?.add(student1)
print(class1?[0]?.dog?.name)

