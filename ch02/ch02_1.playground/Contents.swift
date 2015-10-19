var str = "Hello, playground"

print(str)

var intValue: Int = 100
var doubleValue: Double = 3.14
var strValue: String = "Hello, Swift!"

// var a		// error

var strVar = "String"
var intVar = 100
var doubleVar = 3.14
var boolVar = true
var arrVar = [ 1, 2, 3, 4, 5 ]
var dicVar = [ 1:"one", 2:"two" ]

var a = "num" + "ber"
var b = 2 + 3
var c = "This is \(a) \(b)"

//var d = a + b	//error

var d = a + String(b)

var a1 = 10, a2 = 20

var b1 = 11; var b2 = "11"

let s = "This is a string"
let s2 = s + "!!!"

let v1 = "Hello"
var v2 = "world"
var v = v1 + ", " + v2

//v1 = "hello"	// error

var i = 123

var ii:UInt16 = 24

//var i2:UInt16 = -10	// error

var x10 = 10
var x2 = 0b10
var x8 = 0o10
var x16 = 0x10

var a0 = 0100
var b_ = 100_200_300


var str1 = "Thank" + " you."
var str2 = "Thanks"
var str3 = "!"
var chr:Character = "!"
var str4 = str2 + str3
//var str5 = str2 + chr // 에러!
var str6 = str2 + String(chr)

var empty:String = ""
var empty2 = String()

var length = "12345".characters.count

var hello = "\"hello\""
print(hello)

let c1 = "\u{ab}"		// 1바이트형 유니코드
let c2 = "\u{abcd}"	// 2바이트형 유니코드

let fpvalue = 1.34
let doubleValue1:Double = fpvalue
//let floatValue1:Float = fpvalue	// error

let double1 = 12.34 // 12.34 (소수점을 사용해서 표현하는 방법)
let double2 = 333e-2 // 333 x 10 ^ -2 = 3.33 (10의 승수표현법)
let double3 = 0x11p-4 // 17 x 2 ^ -4 = 1.0625 (2의 승수표현법)

let f80:Float80

let t = true
let f = false

if t {
	print("true")
} else {
	print("false")
}

var animal:Array<String> = [ "dog", "cat", "sheep" ]
var animal2:[String] = [ "dog", "cat", "sheep" ]
var animal3:[[String]] = [["dog", "cat", "sheep"], ["elephant", "monkey"]]
var animal4 = [ "dog", "cat", "sheep" ]

var animal5:[String] = [ ]
var nation = [String]( )
var number:Array<Int> = Array<Int>( )

var student:Dictionary<Int, String> = [1:"freshman", 2:"sophomore", 3:"junior", 4:"senior"]
var student2:Dictionary = [1:"freshman", 2:"sophomore", 3:"junior", 4:"senior"]
var student3:[Int:String] = [1:"freshman", 2:"sophomore", 3:"junior", 4:"senior"]
var student4 = [1:"freshman", 2:"sophomore", 3:"junior", 4:"senior"]

var value:Int? = 32
//var value2:Int = nil	// error

if value == nil {
	print("value is nil.")
} else {
	print("value is not nil.")
}

var value2:String? = "okay"

if value2 == nil {
	print("nil!")
} else {
	print(value2!)
}

var str_:String! = "Hello"
var str_2:String = str_

let (aa, bb) = (10, "Kim")

let nameAndAge = ("Tom", 15)
let (name, _) = nameAndAge
var age = nameAndAge.1

let nameAndAge2 = (name:"Tom", age:15)
print("His name is \(nameAndAge2.name)")


