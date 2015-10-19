var sum:Int = 0
for i in 1...5 {
	sum += i
}

for ch in "Hello, world!".characters {
	print(ch)
}

var sum2:Int = 0
for var i = 0; i < 5; ++i {
	sum2 += i
}

var sum3:Int = 0
for var i = 0; i < 5; ++i {
	if i % 3 == 2 {
		break
	}
	sum3 += i
}

for var i = 0; i < 5; ++i {
	if ( i % 3 == 1 ) { continue }
	print(i)
}

var n = 3;
while n >= 0 {
	print( n-- )
}

var n2 = 0
repeat {
	print(n2)
} while(++n2 < 5)