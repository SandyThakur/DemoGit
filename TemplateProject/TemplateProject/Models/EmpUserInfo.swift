//
//  EmpUserInfo.swift
//  TemplateProject
//
//  Created by Sandeep Thakur on 6/7/17.
//  Copyright © 2017 Mobileprogramming. All rights reserved.
//

import Foundation

class EmpUserInfo:Identifiable  {
    
    var firstName:String?
    var email:String?
    var lastName:String?
    
    static func parseJSON(data:Any?)->ResponseResult<Any>?{
        if let d = data as? [String:String] {
            
            if let status = d["status"], status != "200" {
                let desc = d["msg"]
                let err = APIResponseError.generalError(domain: "Parsing Error", description: desc, errorCode:111)
                return .failure(err)
            }
            
            let userInfo = EmpUserInfo()
            userInfo.firstName = d["first_name"]
            userInfo.lastName = d["last_name"]
            userInfo.email = d["email"]
            
            return .success(userInfo)
        }
        
        let err = APIResponseError.generalError(domain: "Parsing Error", description: "Wrong Data Format", errorCode:111)
        return .failure(err)
    }
    
}
