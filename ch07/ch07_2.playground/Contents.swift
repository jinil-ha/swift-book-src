class Vehicle {
	var numberOfWheels:Int
	
	init(numberOfWheels:Int) {
		self.numberOfWheels = numberOfWheels
	}
}

class Car : Vehicle {
	var maker:String
	
	init(maker:String) {
		self.maker = maker
		super.init(numberOfWheels:4)
	}
}

class Bicycle : Vehicle {
	var color:String
	
	init(color:String) {
		self.color = color
		super.init(numberOfWheels:2)
	}
}

var vehicles:[Vehicle] = [Car(maker:"현대"), Bicycle(color:"흰색")]

for v in vehicles {
	if v is Car {
		let car:Car = v as! Car
		print("자동차: 제조사(\(car.maker))")
	} else if v is Bicycle {
		let bicycle:Bicycle = v as! Bicycle
		print("자전거: 색깔(\(bicycle.color))")
	}
}


var child = Car(maker:"VW")
let parent:Vehicle = child as Vehicle
