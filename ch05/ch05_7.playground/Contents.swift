import Foundation

class Fruit : CustomStringConvertible {
	var name:String = ""
	var color:String = ""
	
	var description:String {
		return "\(name)(\(color))"
	}
}

func Log( let target:CustomStringConvertible ) {
	print( "Log : " + target.description )
}

var apple = Fruit()

apple.name = "사과"
apple.color = "빨간색"

Log(apple)

protocol initByInt {
	init(int:Int)
	
}

class Age : initByInt {
	var age:Int
	required init(int:Int) {
		self.age = int
	}
}

protocol errorDelegate {
	func onError(errorCode:Int)
}

class networkHandler {
	var errDelegate:errorDelegate?
	
	// ...
	init (errDelegate:errorDelegate){
		self.errDelegate = errDelegate
	}
	
}
