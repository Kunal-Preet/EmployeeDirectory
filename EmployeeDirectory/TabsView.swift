//
//  ContentView.swift
//  EmployeeDirectory
//
//  Created by Kunal Preet on 08/09/23.
//

import SwiftUI

struct TabsView: View {
    
    let employeesText: LocalizedStringKey = "Employees"
    let settingsText: LocalizedStringKey = "Settings"
    
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    
    var body: some View {
        TabView {
            EmployeesListView(fromURL: true)
                .tabItem {
                    Label(employeesText, systemImage: "person.3")
                }
            
            SettingsView()
                .tabItem {
                    Label(settingsText, systemImage: "info")
                }
        }
        
        .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
            OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
