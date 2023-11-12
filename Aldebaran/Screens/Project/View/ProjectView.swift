//
//  ProjectView.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

struct ProjectView: View {
    
    // MARK: - Properties
    var pictures: [Picture]
    var selectedProject: Project
    @State var columns: Int = 2
    @Namespace var animation
    @Environment(\.dismiss) var dismiss
    
    
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {
                
                ScrollView {
                    
                    // MARK: Info about project
                    VStack(alignment: .leading) {
                        Text(selectedProject.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.vertical, 16)
                        
                        Text(selectedProject.description)
                            .font(.subheadline)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                ProjectOptionView(project: "\(selectedProject.year)", icon: "calendar")
                                Spacer()
                                ProjectOptionView(project: String(format: "%.1f", selectedProject.square) + " m2", icon: "square")
                                Spacer()
                                ProjectOptionView(project: "\(selectedProject.location)", icon: "location.square")
                                Spacer()
                                ProjectOptionView(project: "\(selectedProject.totalPricePerMeter) / m2", icon: "dollarsign.square")
                            }
                        }
                        .font(.subheadline)
                        .padding(.vertical, 16)
                        
                        // MARK: Pictures
                        GridView(columns: columns, list: pictures) { post in
                            PostCardView(post: post)
                                .matchedGeometryEffect(id: post.id, in: animation)
                        }
                    }
                    .padding(.horizontal)
                    .toolbar {
                        
                        // MARK: Plus scale button
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                columns -= 1
                            } label: {
                                Image(systemName: "plus.magnifyingglass")
                                    .foregroundColor(.second)
                            }
                            .disabled(columns == 1)
                        }
                        
                        // MARK: Minus scale button
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                columns += 1
                            } label: {
                                Image(systemName: "minus.magnifyingglass")
                                    .foregroundColor(.second)
                            }
                            .padding(.horizontal, 10)
                            .disabled(columns == 5)
                        }
                        
                        //  MARK: Left back button
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.second)
                            }
                            .padding(.leading, 10)
                            .navigationBarBackButtonHidden()
                        }
                    }
                    .animation(.easeInOut, value: columns)
                }
            }
            .background(Color.main)
        }
    }
}

// MARK: - Preview
struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePictures: [Picture] = [
            Picture(imageURL: "i1"),
            Picture(imageURL: "i2"),
            Picture(imageURL: "i3"),
            Picture(imageURL: "i4"),
            Picture(imageURL: "i5"),
            Picture(imageURL: "i6"),
            Picture(imageURL: "i7"),
            Picture(imageURL: "i8"),
            Picture(imageURL: "i9"),
            Picture(imageURL: "i10"),
            Picture(imageURL: "i11"),
            Picture(imageURL: "i12"),
        ]
        return ProjectView(pictures: samplePictures, selectedProject: PartnerData.shared.partners[0].projects[0])
    }
}
