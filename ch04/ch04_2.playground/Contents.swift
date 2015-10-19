func calc(n1:Int, n2:Int) -> Int {
	return n1 * n1 + n2
}

func calc2(n1:Int, n2:Int) -> Int {
	return n1 + n2
}

var calcFunc:(Int, Int) -> Int = calc

calcFunc(3, 4)

calcFunc = calc2

calcFunc(3, 4)


let calcFunc2:(Int, Int) -> Int = calc

calcFunc(2, 3)


func greet_morning(name:String) {
	print("Good morning, " + name)
}

func greet_afternoon(name:String) {
	print("Good afternoon, " + name)
}

func greet_evening(name:String) {
	print("Good evening, " + name)
}

func hello(name:String) {
	print("Hello, " + name)
}

func getGreetFunc(time:Int) -> (String) -> () {
	switch time {
	case 5...10:
		return greet_morning
		
	case 12...14:
		return greet_afternoon
		
	case 17...20:
		return greet_evening
		
	default:
		return hello
	}
}

var greetFunc:(String) -> ()

greetFunc = getGreetFunc(13)
greetFunc("Tom")


func actions(count:Int, _ action:() -> ()) {
	for var i=0; i<count; ++i {
		action()
	}
}

func hello() {
	print( "Hello" )
}

actions(-1, hello)
actions(3, hello)


func parent_func() {
	func nested_func() {
		print("I'm nested func!")
	}
	
	for _ in 1...3 {
		nested_func()
	}
}

parent_func()


func selector(sel:Int) -> (Int) -> Int {
	func add(n:Int) -> Int { return n + 1 }
	func sub(n:Int) -> Int { return n - 1 }
	
	if sel >= 0 {
		return add
	}
	
	return sub
}

var f = selector(2)
print( f(3) )

f = selector(-3)
print( f(3) )

