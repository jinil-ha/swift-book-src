var 무한도전:[String] = [ "토토가", "극한알바", "나홀로집에" ]

print(무한도전[1])

var 무한2 = 무한도전[1...2]

for program in 무한도전 {
	print( program );
}

// 수정하기
무한도전[0] = "토요일 토요일은 가수다"
무한도전[1...2] = ["극한 알바", "나홀로 집에"]

// 추가하기
무한도전.append("쩐의 전쟁")
무한도전 += ["유혹의 거인", "도둑들"]
무한도전.insert("열대야", atIndex: 1)

// 삭제하기
무한도전.removeAtIndex(3)
무한도전.removeLast()

print(무한도전)

// EXC_BAD_INSTRUCTION
무한도전[1...3] = ["극한 알바", "나홀로 집에"]

if 무한도전.isEmpty {
	print( "무한도전에 요소가 없습니다.")
} else {
	let len = 무한도전.count
	print( "무한도전에 \(len) 개의 요소가 있습니다." )
}
