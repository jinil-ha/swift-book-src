func count(numbers:[Int], _ eval:(Int) -> Bool) -> Int {
	var cnt = 0
	
	for n in numbers {
		if eval(n) {
			cnt++
		}
	}
	
	return cnt
}

func isPositive(n:Int) -> Bool {
	return n > 0
}

count([-1, 3, 5, -4, 10, -8], isPositive)

count([-1, 3, 5, -4, 10, -8], { (n:Int) -> Bool in return n > 0 })

count([-1, 3, 5, -4, 10, -8], { n in return n > 0 })

count([-1, 3, 5, -4, 10, -8], { n in n > 0 })

count([-1, 3, 5, -4, 10, -8], { $0 > 0 })

count([-1, 3, 5, -4, 10, -8]) { $0 > 0 }

count([-1, 3, 5, -4, 10, -8]) {
	(n:Int) -> Bool in return n > 0
}
