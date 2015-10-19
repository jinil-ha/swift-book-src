//
//  main.swift
//  ARC
//
//  Created by 하진일 on 2015. 9. 13..
//  Copyright © 2015년 Jinil. All rights reserved.
//

import Foundation

class Test {
	var number:Int
	
	init(n:Int) {
		print("init called")
		number = n
	}
	
	deinit {
		print("deinit called")
	}
}

var test = Test(n:10)
var other = test

print("\(test.number) \(other.number)")
test.number = 30

print("\(test.number) \(other.number)")

var v1:Test? = Test(n:100)
var v2:Test? = v1

v1 = nil
v2 = nil

// -----------------------------

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
	var leader:Employee?

	init(name:String) {
		print("Team init")
		self.name = name
		self.leader = nil
	}
		
	deinit {
		print("Team deinit")
	}
}

var lee:Employee? = Employee(name:"이동수")
var dev_team:Team? = Team(name:"개발팀")

lee!.team = dev_team
dev_team!.leader = lee

print("\(dev_team!.name) 팀장 - \(dev_team!.leader!.name)")

lee = nil
dev_team = nil

// ----------------------------------

class Member {
	var name:String
	weak var group:Group?
	
	init(name:String) {
		print("Member init")
		self.name = name
	}
	
	deinit {
		print("Member deinit")
	}
}

class Group {
	var maxMember:Int
	var leader:Member
		
	init(maxMember:Int, leader:Member) {
		print("Group init")
		self.maxMember = maxMember
		self.leader = leader
	}
		
	deinit {
		print("Group deinit")
	}
}

var m1 = Member(name:"홍길동")
var group = Group(maxMember:4, leader:m1)

m1.group = group
print("\(group.leader.name)")

var m2 = Member(name:"홍길순")
group = Group(maxMember:2, leader:m2)
