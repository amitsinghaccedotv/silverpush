//
//  Connection.swift
//  crossover
//
//  Created by Mukta Singh on 1/3/17.
//  Copyright © 2017 Mukta Singh. All rights reserved.
//



import Foundation
import UIKit


let BaseURL = "http://localhost:8080"

private let sharedConnection = Connection()


protocol NetworkServicesDelegate {
    func finishedbyGettingResult(response:AnyObject?,requestName:String);
    func finishedbyGettingError(error:Error,requestName:String);
}

class Connection:NSObject{
    class var sharedInstance: Connection {
        return sharedConnection
    }
    
    
    func ConnectToServer(paramValue : Dictionary<String,String> ,apiName:String, delegate:NetworkServicesDelegate?,requestName:String)
    {
        let URLString = BaseURL + apiName
        
        let url = URL(string: URLString)
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let valid = JSONSerialization.isValidJSONObject(paramValue)
        print(valid)
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: paramValue, options: [])
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            if let data = data {
                
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                    delegate?.finishedbyGettingResult(response: json as AnyObject?,requestName:requestName)
                } else {
                    delegate?.finishedbyGettingError(error: error!, requestName: requestName)
                }
            }
            
        })
        task.resume()
    }
    func AuthenticateServer(apiName:String){
        
    }
}
