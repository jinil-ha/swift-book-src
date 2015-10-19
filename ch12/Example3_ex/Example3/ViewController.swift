//
//  ViewController.swift
//  Example3
//
//  Created by 하진일 on 2015. 6. 1..
//  Copyright (c) 2015년 Jinil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet var expressionField:UITextField!
	@IBOutlet var resultField:UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func textFieldShouldReturn(textField: UITextField!) -> Bool {
		// 키보드를 감춘다.
		textField.resignFirstResponder()
		
		// 입력식을 가져온다.
		let expression = Expression(expressionField.text!)
		
		// 2진수, 16진수를 10진수로 변환한다.
		if !expression.convert() {
			resultField.text = "Converting error!"
			return false
		}
		
		// 입력식을 파싱한다.
		if !expression.parse() {
			resultField.text = "Parsing error!"
			return false
		}
		
		// 입력식을 계산한다.
		if !expression.calculate() {
			resultField.text = "Calculation error!"
			return false
		}
		
		// 결과를 표시한다.
		resultField.text = expression.result
		return true
	}
}

