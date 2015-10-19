var fruits:Dictionary<String,String> = [ "사과":"apple", "바나나":"banana", "포도":"grepe" ]
var fruits2:[String:String] = [ "사과":"apple", "바나나":"banana", "포도":"grepe" ]
var fruits3 = [ "사과":"apple", "바나나":"banana", "포도":"grepe" ]

fruits["사과"]
fruits["바나나"]

print("사과 : " + fruits["사과"]! )

fruits["포도"] = "grape"

fruits["딸기"] = "strawberry"
print(fruits.count)
fruits["바나나"] = nil
print(fruits.count)

if fruits.isEmpty {
	print("fruits is empty.");
} else {
	print("fruits is not empty.");
}

for (key, value) in fruits {
	print("\(key)는 영어로 \(value)입니다.")
}

var fruit_keys = [String](fruits.keys)
var fruit_values = [String](fruits.values)

