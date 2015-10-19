// 인사하는 문자열을 반환하는 함수
func hello(name: String) -> String {
	return "Hello, " + name
}

print( hello("Swift") )
print( hello("Alice") )

func say_hello(name: String) {
	print( "Hello, " + name )
}

say_hello("Swift")
say_hello("Alice")


// 배열의 합계와 평균을 구하는 함수
func calc(numbers:[Int]) -> (sum:Int, average:Double) {
	var sum:Int = 0;
	var average:Double;
	
	for number in numbers {
		sum += number
	}
	average = Double(sum) / Double(numbers.count);
	
	return (sum, average)
}

let numbers = [4,7,1,8,3,13]
let result = calc(numbers)

print(" 합계 : result.sum")
print(" 평균 : result.average")

func plus( n1:Int, n2:Int) -> Int {
	return n1 + n2
}
plus(43, n2:91)


func plus( number1 n1:Int, number2 n2:Int) -> Int {
	return n1 + n2
}
plus(number1:43, number2:91)


func greeting( name: String, greeting: String = "Hello") {
	print( greeting + ", " + name )
}

greeting("Daenerys")
greeting("Tyrion", greeting:"Good morning")


func greeting2( name: String, _ greeting: String = "Hello") {
	print( greeting + ", " + name )
}

greeting2("Arya", "Hey")


func sum(numbers:Int...) -> Int {
	var result = 0
	for num in numbers {
		result += num
	}
	return result
}

let n = sum(10,45,23)
let n2 = sum(11,12,13,14,15,16,17,18,19,20)



func squareAndSum(var baseInt:Int, _ integers:Int...) -> Int {
	baseInt *= baseInt;
	for integer in integers {
		baseInt += integer
	}
	return baseInt
}

squareAndSum(12, 1, 2, 3, 4, 5)


func swap(inout a:Int, inout b:Int) {
	let temp = a
	a = b
	b = temp
}

var a = 3
var b = 5

swap(&a, &b)
