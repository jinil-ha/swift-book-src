//
//  ListFile.swift
//  Example1
//
//  Created by 하진일 on 2015
//  Copyright (c) 2015 하진일. All rights reserved.
//

import Foundation

class WordList {
	let strKey = "list"
	let list:[String]
	
	init?(path:String) {
		let listDic = NSDictionary(contentsOfFile:path)
		
		if listDic == nil {
			list = []
			return nil
		}
		
		list = listDic!.objectForKey(strKey) as! [String]
	}
	
	func each(fn:(String)->()) {
		for word in list {
			fn(word)
		}
	}
}