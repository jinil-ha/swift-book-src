class Cat {
	var name:String = " "
	var age:Int = 0
	
	func grow() {
		age++
	}
	
	func log() {
		print("\(name) : \(age)살")
	}
}

var yaong = Cat()
yaong.name = "야옹이"
yaong.age = 4

yaong.log()
yaong.grow()
yaong.log()


struct Player {
	static var maxNameLength:Int = 5
	
	static func setMaxNameLength( newNameLength:Int ) {
		if newNameLength <= maxNameLength {
			print( "ERROR!!" )
		} else {
			maxNameLength = newNameLength
		}
	}
	
	// ...
}

struct Circle {
	var centerX:Double
	var centerY:Double
	var radius:Double
	
	init(radius:Double) {
		self.centerX = 0
		self.centerY = 0
		self.radius = radius
	}
}

var circle = Circle(radius:7.7)
//var circle2 = Circle(centerX:3.5, centerY:5.1, radius:2.2)

class Square {
	var pointX:Double = 0.0
	var pointY:Double = 0.0
	let sideLength:Double
	
	init(x:Double, y:Double, s:Double) {
		pointX = x
		pointY = y
		sideLength = s
	}
	
	init(s:Double) {
		sideLength = s
	}
}


class Rectangle {
	var x:Int = 0
	var y:Int = 0
	var width:Int = 0
	var height:Int = 0
	
	init?(width:Int, height:Int) {
		if width <= 0 || height <= 0 {
			return nil
		}
		self.width = width
		self.height = height
	}
}

var rect:Rectangle? = Rectangle(width:3, height:4)
var rect2:Rectangle? = Rectangle(width:0, height:4)


class someClass {
	var someProperty:Int = 0
	init(p:Int) {
		self.someProperty = p
	}
	deinit {
		print("Deinitialized.")
	}
}

var a:someClass = someClass(p:10)

