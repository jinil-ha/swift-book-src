let height:Int = 80
if height < 100 {
	print("높이가 100보다 작습니다")
} else {
	print("높이가 100보다 크거나 같습니다.")
}

func buyTabacco(age:Int) {
	guard age > 19 else {
		print("age는 19보다 커야 합니다.")
		return
	}
}

let i:Int = 3
switch i {
case 1, 2:
	print("\(i) is 1 or 2.")
case 3, 4:
	print("\(i) is 3 or 4.")
default:
	print("None")
}

switch i {
case 1...4:
	print("1~4")
case 5...10:
	print("5~10")
default:
	print("None")
}

let s = "Home"
switch s {
case "Home":
	print("At home.")
case "School":
	print("At school.")
default:
	print("None")
}

let size = 15
let color = "red"
switch (size, color) {
case (10, _):
	print("size 10")
case (_, "blue"):
	print("blue")
default:
	print("not ok")
}

let n = 15
switch n {
case 0:
	print("zero")
case _ where n % 2 == 0 :
	print("짝수")
	fallthrough
case _ where n % 2 == 1 :
	print("홀수")
	fallthrough
case _ where n > 0 :
	print("양수")
case _ where n < 0 :
	print("음수")
default:
	break
}

