//
//  EmployeeCell.swift
//  EmployeeDirectory
//
//  Created by Kunal Preet on 08/09/23.
//

import SwiftUI

struct EmployeeCell: View {
    
    var full_name: String
    var team: String
    var photo_url_small: String
    
    var body: some View {
        let image_url = URL(string: photo_url_small)
        HStack {
            AsyncImage(url: image_url) { image in
                image
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } placeholder: {
                Color.gray
            }
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack (alignment: .leading){
                Text(full_name)
                    .font(.headline)
                Text(team)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
