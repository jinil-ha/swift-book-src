struct Position {
	var x:Int
	var y:Int
}

var p1:Position = Position(x:0, y:0)
var p2 = p1

p2.x = 3
p2.y = 4

print( "p1 = (\(p1.x), \(p1.y))")
print( "p2 = (\(p2.x), \(p2.y))")

class Pair {
	var a:Int = 0
	var b:Int = 0
}

var p3:Pair = Pair()
var p4 = p3

p4.a = 3
p4.b = 4

print( "p3 = (\(p3.a), \(p3.b))")
print( "p4 = (\(p4.a), \(p4.b))")
print( p3 )

