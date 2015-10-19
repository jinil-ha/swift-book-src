public enum RobotType {
	case PetRobot
	case Humanoid
	case FactoryRobot
}


public class Car {
	private func openDoor() {
	}
}

internal class Sedan : Car {
	override internal func openDoor() {
	}
}

var car:Sedan = Sedan()
