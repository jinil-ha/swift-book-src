let a:UInt8 = 0b00001111
let b:UInt8 = 0b01010101
let and:UInt8 = a & b // 0b00000101
let or:UInt8 = a | b // 0b01011111
let xor:UInt8 = a ^ b // 0b01011010
let not:UInt8 = ~a // 0b11110000
let lsh:UInt8 = a << 3 // 0b01111000
let rsh:UInt8 = a >> 3 // 0b00000001

var x:UInt8 = 255
x = x &+ 1

var y:Int8 = 127
y = y &+ 1

var n:UInt8 = 0
n = n &- 1

n = 100
n = n &* 3

/* 이것은 /* 샘플 */ 입니다 */

var height:Int = 75 // 책상의 높이
var width:Int = 120 // 책상의 너비

typealias AccountType = Int16
var account:AccountType = 1001

