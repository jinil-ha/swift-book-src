//
//  Parser.swift
//  Example3
//
//  Created by 하진일 on 2015. 6. 5..
//  Copyright (c) 2015년 Jinil. All rights reserved.
//

import Foundation

enum ParseType {
	case NONE, NUMBER, OPERATOR, BRACKET_OPEN, BRACKET_CLOSE
	func isSafe( nextParse:ParseType ) -> Bool {
		switch self {
		case NONE, OPERATOR, BRACKET_OPEN:
			switch nextParse {
			case NUMBER, BRACKET_OPEN:
				return true
				
			default:
				return false
			}
			
		case NUMBER:
			switch nextParse {
			case NUMBER, OPERATOR, BRACKET_CLOSE:
				return true
				
			default:
				return false
			}
			
		case BRACKET_CLOSE:
			switch nextParse {
			case OPERATOR, BRACKET_CLOSE:
				return true
				
			default:
				return false
			}
		}
	}
	
	func canLast() -> Bool {
		if self == NUMBER || self == BRACKET_CLOSE {
			return true
		}
		return false
	}
}

class Parser {
	let string:String
	
	init(string:String) {
		self.string = string
	}
	
	func parse() -> [String]? {
		var result:[String] = []
		
		var bracketCount:Int = 0
		var lastElement:String? = nil
		var lastParse:ParseType = ParseType.NONE
		var isPoint:Bool = false
		
		for ch in self.string.characters {
			switch (ch) {
			case "0"..."9":
				if !lastParse.isSafe(ParseType.NUMBER) {
					return nil
				}
				
				if lastParse == ParseType.NUMBER {
					lastElement!.append(ch)
				} else {
					if lastParse != ParseType.NONE {
						result.append(lastElement!)
						NSLog("element : \(lastElement!)")
					}
					
					isPoint = false
					lastParse = ParseType.NUMBER
					lastElement = String(ch)
				}
				
			case ".":
				if !lastParse.isSafe(ParseType.NUMBER) {
					return nil
				}
				
				if lastParse != ParseType.NUMBER {
					if lastParse != ParseType.NONE {
						result.append(lastElement!)
						NSLog("element : \(lastElement!)")
					}
					
					lastParse = ParseType.NUMBER
					lastElement = String("0")
				} else if isPoint {
					return nil
				}
				
				isPoint = true
				lastElement!.append(ch)
				
			case "+","-","*","/","^","%":
				if !lastParse.isSafe(ParseType.OPERATOR) {
					return nil
				}
				
				if lastParse != ParseType.NONE {
					result.append(lastElement!)
					NSLog("element : \(lastElement!)")
				}
				
				lastParse = ParseType.OPERATOR
				lastElement = String(ch)
				
			case "(":
				if !lastParse.isSafe(ParseType.BRACKET_OPEN) {
					return nil
				}
				
				if lastParse != ParseType.NONE {
					result.append(lastElement!)
					NSLog("element : \(lastElement!)")
				}
				
				bracketCount++
				
				lastParse = ParseType.BRACKET_OPEN
				lastElement = String(ch)
				break
				
			case ")":
				if !lastParse.isSafe(ParseType.BRACKET_CLOSE) {
					return nil
				}
				
				if lastParse != ParseType.NONE {
					result.append(lastElement!)
					NSLog("element : \(lastElement!)")
				}
				
				bracketCount--
				if bracketCount < 0 {
					return nil
				}
				
				lastParse = ParseType.BRACKET_CLOSE
				lastElement = String(ch)
				break
				
			case " ":
				break;
				
			default:
				NSLog("ERROR : cannot parsing character '%@'", String(ch))
				return nil
			}
		}
		
		if bracketCount != 0 {
			return nil
		}
		
		if !lastParse.canLast() {
			return nil
		}
		
		result.append(lastElement!)
		NSLog("element : \(lastElement!)")
		
		return result
	}
	
}