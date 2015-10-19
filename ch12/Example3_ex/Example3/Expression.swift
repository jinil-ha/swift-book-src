//
//  Expression.swift
//  Example3
//
//  Created by 하진일 on 2015. 6. 1..
//  Copyright (c) 2015년 Jinil. All rights reserved.
//

import Foundation

class Expression {
	var string:String
	var elements:[String]?
	var result:String {
		get {
			return elements![0]
		}
	}
	
	init(_ string:String) {
		self.string = string.lowercaseString
	}
	
	func process(inout idx:Int, inout _ len:Int, _ cal:(Double,Double) -> Double) {
		let num1 = (self.elements![idx-1] as NSString).doubleValue
		let num2 = (self.elements![idx+1] as NSString).doubleValue
		
		let result = String(format:"%f", cal(num1,num2))
		
		NSLog("Calculating : \(num1) \(self.elements![idx]) \(num2) = \(result)")
		
		self.elements!.removeAtIndex(idx)
		self.elements!.removeAtIndex(idx)
		len = len - 2
		
		elements![--idx] = result
	}
	
	func process1(inout idx:Int, inout _ len:Int, _ cal:(Double) -> Double) {
		let num1 = (self.elements![idx+1] as NSString).doubleValue
		
		let result = String(format:"%f", cal(num1))
		
		NSLog("Calculating : \(self.elements![idx]) \(num1) = \(result)")
		
		self.elements!.removeAtIndex(idx)
		len = len - 1
		
		elements![idx] = result
	}
	
	func calculate(index:Int = 0) -> Bool {
		
		// 괄호를 우선처리한다.
		var len = elements!.count
		for var idx = index; idx < len; idx++ {
			let element = elements![idx]
			if element == "(" {
				self.calculate(idx+1)
				elements!.removeAtIndex(idx)		// delete (
				elements!.removeAtIndex(idx+1)	// delete )
				
				len = elements!.count
			} else if element == ")" {
				len = idx
			}
		}
		
		// 함수를 처리한다.
		for var idx = index; idx < len; idx++ {
			let element = elements![idx]
			if element == "sqrt" {
				process1(&idx, &len, sqrt)
			} else if element == "sin" {
				process1(&idx, &len, sin)
			} else if element == "cos" {
				process1(&idx, &len, cos)
			} else if element == "tan" {
				process1(&idx, &len, tan)
			} else if element == "exp" {
				process1(&idx, &len, exp)
			} else if element == "log" {
				process1(&idx, &len, log)
			}
		}
		
		// 제곱계산(^)을 처리한다.
		for var idx = index; idx < len; idx++ {
			let element = elements![idx]
			if element == "^" {
				process(&idx, &len, pow)
			}
		}
		
		// 곱셈(*), 나눗셈(/), 나머지(%)를 처리한다.
		for var idx = index; idx < len; idx++ {
			let element = elements![idx]
			if element == "*" {
				process(&idx, &len, *)
			} else if element == "/" {
				process(&idx, &len, /)
			} else if element == "%" {
				process(&idx, &len, %)
			}
		}
		
		// 덧셈(+), 뺄셈(-)을 처리한다.
		for var idx = index; idx < len; idx++ {
			let element = elements![idx]
			if element == "+" {
				process(&idx, &len, +)
			} else if element == "-" {
				process(&idx, &len, -)
			}
		}
		
		if elements!.count > 1 {
			return false
		}
		
		return true
	}
	
	// 16진수, 2진수를 찾아서 먼저 변환한다.
	func convert() -> Bool {
		enum STATE {
			case NONE, ZERO, BINARY, DECIMAL, HEXADECIMAL
		}
		
		var stringConverted = ""
		var number = 0
		var state:STATE = .NONE
		
		for ch in self.string.characters {
			switch (ch) {
			case "0":
				switch state {
				case .NONE:
					state = .ZERO
					
				case .ZERO, .DECIMAL:
					state = .DECIMAL
					stringConverted.append(ch)
					
				case .BINARY:
					number *= 2
					
				case .HEXADECIMAL:
					number *= 16
				}
				
			case "1"..."9":
				switch state {
				case .NONE, .ZERO, .DECIMAL:
					state = .DECIMAL
					stringConverted.append(ch)
					
				case .BINARY:
					if ch == "1" {
						number = number * 2 + 1
					} else {
						return false
					}
					
				case .HEXADECIMAL:
					number = number * 16 + Int(String(ch))!
				}
				
			case "a"..."f":
				switch state {
				case .NONE:
					stringConverted.append(ch)
					
				case .ZERO:
					if ch == "b" {
						state = .BINARY
					} else {
						return false
					}
					
				case .HEXADECIMAL:
					let num = Int(strtoul(String(ch), nil, 16))
					number = number * 16 + num
					
				default:
					return false
				}
				
			case "x":
				switch state {
				case .NONE:
					stringConverted.append(ch)
					
				case .ZERO:
					state = .HEXADECIMAL

				default:
					return false
				}
				
			case ".":
				switch state {
				case .NONE, .ZERO, .DECIMAL:
					state = .DECIMAL
					stringConverted.append(ch)
					
				default:
					return false
				}
				
			default:
				if state == .BINARY || state == .HEXADECIMAL {
					stringConverted += String(number)
				}
				state = .NONE
				stringConverted.append(ch)
			}
		}
		
		if state == .BINARY || state == .HEXADECIMAL {
			stringConverted += String(number)
		}
		self.string = stringConverted
		print("converted string : ", self.string)
		return true
	}
	
	func parse() -> Bool {
		let parser:Parser = Parser(string:string)
		
		self.elements = parser.parse()
		
		return self.elements != nil
	}
}