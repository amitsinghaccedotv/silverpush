//
//  Utils.swift
//  crossover
//
//  Created by Mukta Singh on 1/4/17.
//  Copyright © 2017 Mukta Singh. All rights reserved.
//

import UIKit

class Utils: NSObject {

    static func GetAlert(message:String , title:String ,toViewController:ViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        toViewController.present(alert, animated: true, completion: nil)
    }
    
    static func isValidEmailID(email:String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    static func isPasswordValided(passowrd:String )-> Bool{
        return true;
    }
}
