enum Blood {
	case A, B, O, AB
	func name() -> String {
		switch self {
		case .A:
			return "A형"
		case .B:
			return "B형"
		case .O:
			return "O형"
		case .AB:
			return "AB형"
		}
	}
}

class Person {
	var name:String = ""
	var sex:Bool = true // true : 남자, false :　여자
	var height:Int = 0
	var blood:Blood = .A
	
	func sexName() -> String {
		return sex ? "남자" : "여자"
	}
}


var p1 = Person()

p1.name = "홍길동"
p1.sex = true
p1.height = 180
p1.blood = Blood.A

print("\(p1.name) / \(p1.sexName()) / \(p1.height)cm / \(p1.blood.name())")


class CreditCard {
	var cardNo:Int64
	var name:String
	
	init() {
		cardNo = 1111222233334444
		name = "GILDONG HONG"
	}
}

