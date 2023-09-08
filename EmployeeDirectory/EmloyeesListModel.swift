//
//  EmloyeesListModel.swift
//  EmployeeDirectory
//
//  Created by Kunal Preet on 08/09/23.
//

import Foundation

struct EmployeesListModel: Hashable, Codable {
    let employees: [Employees]
}

struct Employees: Hashable, Codable {
    
    let uuid: String
    let full_name: String
    let phone_number: String?
    let email_address: String
    let biography: String?
    let photo_url_small: String?
    let photo_url_large: String?
    let team: String
    let employee_type: String
}
