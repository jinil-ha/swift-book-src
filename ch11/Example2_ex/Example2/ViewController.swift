//
//  ViewController.swift
//  Example2
//
//  Created by 하진일 on 2015. 10. 5..
//  Copyright © 2015년 Jinil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UIWebViewDelegate {
	@IBOutlet var urlText:UITextField!
	@IBOutlet var webView:UIWebView!
	@IBOutlet var resultLabel:UILabel!
	@IBOutlet var userAgentText:UITextField!
	
	var userAgentList:[[String:String]] = []
	var userAgentSelected = 0
	var userAgentPickerView = UIPickerView()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view, typically from a nib.
		self.urlText.text = "https://www.google.com/"
		self.resultLabel.text = "none"
		
		guard let plistPath = NSBundle.mainBundle().pathForResource("userAgent", ofType: "plist") else {
			return
		}
		
		guard let plist = NSDictionary(contentsOfFile:plistPath) else {
			return
		}
		
		self.userAgentList = plist.objectForKey("userAgent") as! [[String:String]]
		self.userAgentPickerView.dataSource = self
		self.userAgentPickerView.delegate = self
		self.userAgentText.inputView = userAgentPickerView
		
		request()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func request() {
		guard urlText.text != nil else {
			print("no url")
			return
		}
		
		let url = NSURL(string:urlText.text!)
		
		guard url != nil else {
			print("invalid url")
			return
		}
		
		let req = NSURLRequest(URL:url!)
		self.request(req)
	}

	func request(request:NSURLRequest) {
		let req = request.mutableCopy() as! NSMutableURLRequest
		
		req.addValue("ko", forHTTPHeaderField: "Accept-Language")
		let userAgentString = userAgentList[userAgentSelected]["string"]!
		req.addValue(userAgentString, forHTTPHeaderField: "User-Agent")
		
		let session = NSURLSession.sharedSession()
		let task = session.dataTaskWithRequest(req) {
			(data, resp, error) -> Void in
			
			guard error == nil else {
				//print(error)
				return
			}
			
			guard resp != nil else {
				print("resp is nil.")
				return
			}
			
			let httpResp = resp as? NSHTTPURLResponse
			guard httpResp != nil else {
				print("httpResp is nil.")
				return
			}
			
			dispatch_async(dispatch_get_main_queue()) {
				self.printResult(httpResp!)
				
				let mimeType = httpResp!.MIMEType
				let encode = httpResp!.textEncodingName
				
				self.webView.loadData(data!, MIMEType: mimeType!, textEncodingName: encode!, baseURL: req.URL!)
			}
		}
		
		task.resume()
	}
	
	func printResult(resp:NSHTTPURLResponse) {
		if resp.statusCode == 200 {
			var resultText = String()
			for (key, value) in resp.allHeaderFields {
				resultText = resultText + String("\n\(key) : \(value)")
			}
			
			resultLabel.text = resultText
		} else {
			resultLabel.text = String(format:"Error : %d", resp.statusCode)
		}
	}
	
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return userAgentList.count
	}
	
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return userAgentList[row]["name"]
	}
	
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)	{
		userAgentSelected = row
		userAgentText.text = userAgentList[row]["name"]
	}
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		request()
		return true
	}
	
	func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
		if (navigationType == UIWebViewNavigationType.LinkClicked) {
			self.request(request)
			return false
		}
		return true
	}
}
