//
//  ViewController.swift
//  crossover
//
//  Created by Mukta Singh on 1/3/17.
//  Copyright © 2017 Mukta Singh. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController,NetworkServicesDelegate,UITextFieldDelegate{
    @IBOutlet weak var email : UITextField?
    @IBOutlet weak var password : UITextField?
    
    let RegistrationAPI = "/api/v1/register"
    let LoginApi = "/api/v1/register"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        email?.delegate=self;
        password?.delegate=self;
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    
    /* Textfield delegates here */
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /* Call all connection delegates here */
    internal func finishedbyGettingResult(response: AnyObject?, requestName: String) {
        print("response",response)
       
//        UserDefaults.standard.setValue(token, forKey: "user_auth_token")
//        print("\(UserDefaults.standard.value(forKey: "user_auth_token")!)")
        
    }
    
    internal func finishedbyGettingError(error: Error, requestName: String) {
        print("error while getting result",error)
    }
    
    @IBAction func LoginClicked(_ sender: UIButton) {
        print("Login clicked")
        if !Utils.isValidEmailID(email: (email?.text)!) {
            Utils.GetAlert(message:"Please enter a valid Email ID", title: "Error", toViewController: self)
        }
        
    }
    /* Sign-up */
    @IBAction func SignupClicked(_ sender: UIButton) {
        print("Signup clicked")
        if !Utils.isValidEmailID(email: (email?.text)!) {
            Utils.GetAlert(message:"Please enter a valid Email ID", title: "Error", toViewController: self)
        }
        else{
            var params = [String :  String]();
            params = ["email" : "crossover@crossover.com", "password" : "crossover"];
            self.CallWebServerice(params: params,reqeustName: "Registration");
        }
    
    }
     /*  webservices called here */
    func CallWebServerice(params:Dictionary <String,String> , reqeustName:String){
        switch reqeustName {
            
        case "Registration":
            Connection.sharedInstance.ConnectToServer(paramValue: params, apiName: RegistrationAPI, delegate: self, requestName: "Registration")
        case "Login":
            Connection.sharedInstance.ConnectToServer(paramValue: params, apiName: LoginApi, delegate: self, requestName: "Login")
            
        default:
            break
        }
        
    }
    func LoginUser(params:Dictionary <String,String>){
        
    }
    
    
}

