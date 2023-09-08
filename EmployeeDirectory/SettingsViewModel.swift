//
//  SettingsViewModel.swift
//  EmployeeDirectory
//
//  Created by Kunal Preet on 08/09/23.
//

import Foundation

class SettingsViewModel: ObservableObject {
    @Published var bundle_version: String = "1.0"
    @Published var display_name: String = "Employee Directory"
    @Published var bundle_identifier: String = "com.example.kunalpreet.EmployeeDirectory"
    @Published var creator_name: String = "Kunal Preet"
}
