struct Person {
	var name:String = ""
}

class Family {
	var dad:Person = Person()
	var mom:Person = Person()
	var children:[Person] = []
	
	subscript(index:Int) -> String? {
		if index >= 0 && index < children.count {
			return children[index].name
		}
		return nil
	}
}

var family = Family()

family.dad = Person(name:"송일국")
family.mom = Person(name:"정승연")
family.children = [Person(name:"대한"), Person(name:"민국"), Person(name:"만세")]

print("\(family[0]!) \(family[1]!) \(family[2]!)")
