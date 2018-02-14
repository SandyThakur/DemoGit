//
//  EmpIDViewModel.swift
//  TemplateProject
//
//  Created by Sandeep Thakur on 6/7/17.
//  Copyright © 2017 Mobileprogramming. All rights reserved.
//

import Foundation

class EmpIDViewModel:BaseViewModels, ViewModelParams {
    
    func apiCallWithType(type:ServicePath){
       let empIDEnvelope = EmpDetailEnvelop(pathType: type)
        let webAPIWrapper:WebAPIWrapper = WebAPIWrapper()
        webAPIWrapper.delegate = self
        webAPIWrapper.callServiceWithRequest(requestEnvelop: empIDEnvelope)
    }

}
