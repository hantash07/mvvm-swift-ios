//
//  EmployeeViewModel.swift
//  mvvm-swift-ios
//
//  Created by Hantash on 16/12/2021.
//

import Foundation

class EmployeeViewModel: NSObject {
    
    private var apiService: APIService!
    private(set) var employees: [Employee]! {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    public var bindEmployeeViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
    }
    
    func requestGetEmployee() {
        self.apiService.requestGetEmployee { employees in
            self.employees = employees
        }
    }
    
}
