enum CarError : ErrorType {
	case NotGas
	case GasFull
	case DoorOpened
}

class Car {
	let name:String
	var color:String
	var gas:Int
	let maxGas:Int
	var doorOpened:Bool
	
	init(name:String, color:String, maxGas:Int) {
		self.name = name
		self.color = ""
		self.gas = 0
		self.maxGas = maxGas
		self.doorOpened = false
		
		print("Car의 인스턴스가 생성되었습니다.")
	}
	
	func addGas(gas:Int) throws -> Bool {
		guard self.gas + gas <= self.maxGas else {
			self.gas = self.maxGas
			throw CarError.GasFull
		}
		
		self.gas += gas
		return true
	}
	
	func start() throws {
		guard gas > 0 else {
			throw CarError.NotGas;
		}
		guard !doorOpened else {
			throw CarError.DoorOpened;
		}
	}
}

var car = Car(name:"Rara", color:"black", maxGas:40)

do {
	try car.addGas(30)
	try car.addGas(20)
	print("연료를 추가하였습니다.")
} catch CarError.GasFull {
	print("연료가 가득찼습니다.")
} catch {
	print("예외발생")
}

enum SomeError : ErrorType {
	case CriticalError(code:Int)
	case Warning(canContinue:Bool)
}

//try! car.addGas(10)

func work(state:Int) {
	print("작업 시작")
	defer {
		print("작업 종료")
	}
	
	print("작업 단계1")
	if state != 8 {
		return
	}
	
	print("작업 단계2")
}

work(3)
