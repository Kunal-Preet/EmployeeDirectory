//
//  SettingsView.swift
//  EmployeeDirectory
//
//  Created by Kunal Preet on 08/09/23.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var viewModel = SettingsViewModel()
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Bundle Version: \(viewModel.bundle_version)")
                .font(.headline)
                .padding(.bottom, 10)
            Text("Display Name: \(viewModel.display_name)")
                .font(.headline)
                .padding(.bottom, 10)
            Text("Bundle Identifier: \(viewModel.bundle_identifier)")
                .font(.headline)
                .padding(.bottom, 10)
            Text("Creator Name: \(viewModel.creator_name)")
                .font(.headline)
                .padding(.bottom, 10)
        }
        .padding(.leading, 30)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
