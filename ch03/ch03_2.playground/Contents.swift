var animals:Set = ["monkey", "elephant", "snake", "dog"]

print(animals)

animals.insert("cat")

print(animals)

animals.insert("dog")

print(animals)

if animals.contains("elephant") {
	print("ok!")
} else {
	print("Not elephant!")
}

animals.remove("elephant")

if animals.contains("elephant") {
	print("ok!")
} else {
	print("Not elephant!")
}

for animal in animals {
	print(animal)
}

for animal in animals.sort() {
	print(animal)
}