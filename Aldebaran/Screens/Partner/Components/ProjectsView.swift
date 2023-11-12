//
//  ProjectsView.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

struct ProjectsView: View {
    
    let model: Partner
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Projects: \(model.projects.count)")
                .padding(.horizontal)
                .font(.headline)
                .padding(.top)
                .padding(.bottom, 8)
                .foregroundColor(.font)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(model.projects) { item in
                        if let firstPicture = item.pictures.first {
                            NavigationLink(destination: ProjectView(pictures: item.pictures, selectedProject: item)) {
                                Image(firstPicture.imageURL)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                                    .offset(x: 16)
                            }
                        }
                    }
                }
                .padding(.trailing, 32)
            }
            .shadow(color: .black.opacity(0.4), radius: 10)
            .padding(.bottom)
        }
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView(model: PartnerData.shared.partners[3])
    }
}
