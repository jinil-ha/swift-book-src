//
//  main.swift
//  Example1
//
//  Created by 하진일 on 2015
//  Copyright (c) 2015 하진일. All rights reserved.
//

import Foundation

// 명령행 인자를 검사한다.
if Process.arguments.count < 2 {
	print("Usage: \(Process.arguments[0]) list_file")
	exit(1)
}

//print(“List file is \(Process.arguments[1])”)

// 키워드리스트 화일을 읽는다.
let wordList = WordList(path:Process.arguments[1])
if wordList == nil {
	print("File load error")
	exit(1)
}

// 각 키워드에 대해서 검색한다.
var word:String
for word in wordList!.list {
	// OpenAPI 요청을 보낸다.
	let search = Search(keyword:word)
	if search.request() == false {
		print("Search error : \(search.keyword)")
		exit(1)
	}
	
	// 결과를 파싱한다.
	if search.parse() == false {
		print("Parse error : \(search.keyword)")
		exit(1)
	}
	
	// 결과를 출력한다.
	print( "\(search.keyword) : total(\(search.totalCount)), page(\(search.pageCount))" )
}


