var a:Int
var b:Int
a = 1
b = 2
//a = b = 3	// error

var (a2, b2) = (1, 2)

let a_ = 1 + 7
let b_ = 5 - 3.5
let c = 1.9 * 6.0
let d = 7 / 2
let e = 16 % 5

let div1 = 9 / 4 // 결과값 2
let div2 = 9 / 4.0 // 결과값 2.25

let mod1 = 14 % 3 // 2
let mod2 = 14 % 3.2 // 1.2
let mod3 = 14.2 % 3.2 // 1.4

let string1 = "abc" + "def"

var i = 0
i++
++i

var int1 = 3
var int2 = ++int1
var int3 = int1++
var int4 = int1

var i2 = 5
//var j2 = ++i2--	// error

let val1 = -5
let val2 = -val1

var val3 = -5
//var val4 = - val3		// error

var v = 3
v += 5

v -= 1
v *= 3
v /= 2
v %= 3

//y = v += 3	// error

a == b // a와 b가 같은가
a != b // a와 b가 다른가
a > b // a가 b보다 큰가
a >= b // a가 b와 같거나 큰가
a < b // a가 b보다 작은가
a <= b // a가 b와 같거나 작은가

let a3 = 3
let b3 = (a3 > 5) ? a3 - 5 : a3

var b4:Int
if (a3 > 5) {
	b4 = a3 - 5
} else {
	b4 = a3
}

var a5 = 3
var b5 = a5 > 5 ? ++a5 : ++a5


var x1:Int? = 3
var y1:Int = x1 ?? 5
var x2:Int? = nil
var y2:Int = x2 ?? 2


if x1 == nil {
	y1 = 4
} else {
	y1 = x1!
}

for i in 1...3 {
	print(i)
}

let animals = [ "Tiger", "Lion", "Monkey" ]
for n in 0..<animals.count {
	print(animals[n])
}

let age = 22
let blood = "A"
if age >= 18 && blood == "A" {
	print("OK")
} else {
	print("Not OK")
}
