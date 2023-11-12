//
//  ProjectOptionView.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

struct ProjectOptionView: View {
    
    let project: String
    var icon: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 90, height: 90)
            .foregroundColor(.main)
            .shadow(color: .second.opacity(0.15), radius: 10)
            .overlay {
                VStack(spacing: 6) {
                    Image(systemName: icon)
                        .font(.title)
                    Text(project)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                }
                .foregroundColor(.font)
            }
    }
}

struct ProjectOptionView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectOptionView(project: "project", icon: "calendar")
    }
}

