//
//  QAObject.swift
//  
//
//  Created by Annie Seth on 2/9/20.
//


import UIKit

class QAObject: NSObject {

    public var question: String = ""
    public var answer: String = ""
    
    
    func QAObject(q: String, a: String){
        question = q
        answer = a
    }
   
}
