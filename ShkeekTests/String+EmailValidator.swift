//
//  String+EmailValidator.swift
//  Shkeek
//
//  Created by Zachary Shakked on 3/19/15.
//  Copyright (c) 2015 Shkeek Inc. All rights reserved.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        println("validate calendar: \(self)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        if let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx) {
            return emailTest.evaluateWithObject(self)
        }
        return false
    }
}