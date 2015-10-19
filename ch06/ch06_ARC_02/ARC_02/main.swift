
class Employee {
	var name:String
	var team:Team?
	
	init(name:String) {
		print("Employee init")
		self.name = name
		self.team = nil
	}
	
	deinit {
		print("Employee deinit")
	}
}

class Team {
		var name:String
		unowned var leader:Employee
		
		init(name:String, leader:Employee) {
		print("Team init")
		self.name = name
		self.leader = leader
		}
		
		deinit {
		print("Team deinit")
		}
}

var emp1:Employee? = Employee(name:"이동수")
var team1:Team? = Team(name:"개발팀", leader:emp1!)

emp1!.team = team1

team1 = nil
emp1 = nil