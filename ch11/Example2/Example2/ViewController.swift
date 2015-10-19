//
//  ViewController.swift
//  Example2
//
//  Created by 하진일 on 2015. 10. 5..
//  Copyright © 2015년 Jinil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet var urlText:UITextField!
	@IBOutlet var webView:UIWebView!
	@IBOutlet var resultLabel:UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		urlText.text = "https://www.google.com/"
		resultLabel.text = "none"
		
//		let url = NSURL(string:urlText.text!)!
//		let req = NSURLRequest(URL: url)
//		webView.loadRequest(req)
		
		request()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func request() {
		let url = NSURL(string:urlText.text!)!
		//let req = NSURLRequest(URL: url)
		let req = NSMutableURLRequest(URL:url)
		
		req.addValue("ko-kr", forHTTPHeaderField: "Accept-Language")
		req.addValue("Mozilla/6.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/8.0 Mobile/10A5376e Safari/8536.25", forHTTPHeaderField: "User-Agent")
		
		let session = NSURLSession.sharedSession()
		let task = session.dataTaskWithRequest(req) {
			(data, resp, error) -> Void in
			
			guard error == nil else {
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

				self.webView.loadData(data!, MIMEType: mimeType!, textEncodingName: encode!, baseURL: url)
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
}

