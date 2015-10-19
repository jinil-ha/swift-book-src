class Figure {
	var name:String = ""
	var pointX:Double = 0
	var pointY:Double = 0
	
	func description() -> String {
		return "\(self.name) = (\(pointX), \(pointY))"
	}
}

class Circle : Figure {
	var radius:Double = 0
	
	func area() -> Double {
		return self.radius * self.radius * 3.14159
	}
	
	override func description() -> String {
		return super.description() + ", r = \(self.radius)"
	}
}

class Rectangle : Figure {
	var width:Double = 0
	var height:Double = 0
	
	func area() -> Double {
		return width * height
	}
}

var f = Circle()

f.name = "작은원"
f.pointX = 15
f.pointY = 22
f.radius = 20

print( f.area() )
print( f.description() )

class Movie {
	var name:String = ""
	var playTime:Int = 0
	
	final func description() -> String {
		return "\(name) \(playTime)"
	}
}

class MovieFile : Movie {
	var filename:String = ""
	
//	override func description() -> String {	//error
//		return super.description() + " \(filename)"
//	}
}
