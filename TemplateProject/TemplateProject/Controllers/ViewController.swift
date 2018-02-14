//
//  ViewController.swift
//  TemplateProject
//
//  Created by Vishal Lohia on 4/10/17.
//  Copyright © 2017 Mobileprogramming. All rights reserved.
//

import UIKit
import SwiftyBeaver

class ViewController: UIViewController {

    let viewModel = LoginViewModel()
    let viewModelReg = RegistrationViewModel()
    let viewModelEmpID = EmpIDViewModel()
    let log = SwiftyBeaver.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* For custom logging. Check SwiftyBeaver Class */
        let console = ConsoleDestination()
        console.format = "$DHH:mm:ss$d $L $M"
        log.addDestination(console)
        
        //callRegistrationService()
        callLoginService()
    }

    //MARK: Login Service Call/Registration Service Call..
    func callLoginService() {
        let login = ServicePath.login(username: "vishal.lohia@mobileprogrammingllc.com", password: "welcome")
        viewModel.delegate = self
        viewModel.apiCallWithType(type: login)
    }
    
    func callRegistrationService() {
         let registration = ServicePath.registration(first_name: "Vishal", last_name: "Lohia", email: "vishal.lohia@mobileprogrammingllc.com", pass: "welcome", deviceid: "vishal12341fsdf", phone: "2345678903")
        viewModelReg.delegate = self
        viewModelReg.apiCallWithType(type: registration)
    }
    
    func callEmpDetailService() {
        let emp_ID = ServicePath.employeeDetail(emp_ID: "123456")
        viewModelEmpID.delegate = self
        viewModelEmpID.apiCallWithType(type: emp_ID)
    }

}

extension ViewController:BaseModelDelegate {
    
    func refreshController(model:BaseViewModels?,info:Any?,error:Error?) {
            //Refresh the screen over here...
        
        log.debug(viewModel.userInfo?.firstName as Any)
    }
}

