//
//  Expression.swift
//  Example3
//
//  Created by 하진일 on 2015. 6. 1..
//  Copyright (c) 2015년 Jinil. All rights reserved.
//

import Foundation

class Expression {
	let string:String
	var elements:[String]?
	var result:String {
		get {
			return elements![0]
		}
	}
	
	init(_ string:String) {
		self.string = string
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
		
		sqrt(3.3)
		
		return true
	}
	
	func parse() -> Bool {
		let parser:Parser = Parser(string:string)
		
		self.elements = parser.parse()
		
		return self.elements != nil
	}
}