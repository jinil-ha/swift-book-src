//
//  searchapi.swift
//  Example1
//
//  Created by 하진일 on 2015
//  Copyright (c) 2015 하진일. All rights reserved.
//

import Foundation

class Search : NSObject, NSXMLParserDelegate {
	// OpenAPI 요청을 위한 상수
	// 아래 apikey는 이미 삭제된 키로 자신의 apikey를 발급받아서 사용하도록 하자.
	let apikey = "819d0942c64e3f179abc6541363dec33"
	// 과제 1. 아래 정보를 네이버에서 제공하는 정보로 바꾸면 네이버의 오픈API를 사용할 수 있다.
	//  네이버 개발자 센터(http://developer.naver.com/)를 참고하도록 하자.
	//  예를 들어 url_format을 "http://openapi.naver.com/search?target=webkr&key=%@&query=%@"로 하면
	//  네이버 오픈API를 사용해서 검색결과수를 구할 수 있다.
	//  다만 네이버 API의 경우는 전체검색결과를 total이라는 엘리먼트로 반환하고, 페이지수는 반환하지 않는다.
	//  따라서 전체 결과수만 출력하거나, 적당한 수로 나누어서 페이지수를 구할 수 있다.
	let url_format = "http://apis.daum.net/search/web?apikey=%@&q=%@&output=xml"
	let totalCountElement = "totalCount"
	let pageCountElement = "pageCount"
	let keyword:String      // 검색할 키워드
	
	// 과제 2. 웹 검색이 아니라, 다른 카테고리의 검색의 경우는 url_format을 적절히 바꾸어서 구할 수 있다.
	//  예를 들어 책 검색의 경우는 "http://openapi.naver.com/search/book?target=webkr&key=%@&query=%@"
	//  이미지 검색의 경우는 "http://openapi.naver.com/search/image?target=webkr&key=%@&query=%@"
	//  로 해서 구할 수 있다.
	
	// 결과
	var resultData:NSData?      // OpenAPI의 결과
	var totalCount:Int = 0
	var pageCount:Int = 0
	
	// 파싱에 필요한 변수
	var parseElement:NSString? = nil
	var parseData:NSMutableString? = nil
	
	// init
	// keyword를 받아서 인스턴스를 생성한다.
	//
	init(keyword:String) {
		self.keyword = keyword
	}
	
	// request
	// OpenAPI를 호출한다.
	//
	func request() -> Bool {
		// 요청을 보내기 위한 NSURL 인스턴스를 생성한다.
		let encodedKeyword = keyword.stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())!
		let url = NSURL(string:String(format:url_format, apikey, encodedKeyword))
		if url == nil {
			return false
		}
		
		// 요청을 보낸다.
		resultData = NSData(contentsOfURL: url!)
		if resultData == nil {
			return false
		}
		
		return true
	}
	
	// parse
	// 요청결과를 파싱하여 검색결과를 생성한다.
	//
	func parse() -> Bool {
		let parser = NSXMLParser(data: self.resultData!)
		
		parseData = NSMutableString()
		parser.delegate = self
		
		return parser.parse()
	}
	
	// MARK: NSXMLParserDelegate
	//
	func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String :String]) {
		parseElement = elementName
		parseData = ""
	}
	
	func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
		switch(parseElement! as String) {
		case totalCountElement:
			totalCount = Int((parseData! as String))!
			break
			
		case pageCountElement:
			pageCount = Int((parseData! as String))!
			break
			
		default:
			break
		}
		parseData = ""
	}
	
	func parser(parser: NSXMLParser, foundCharacters string: String) {
		parseData!.appendString(string)
	}
}
