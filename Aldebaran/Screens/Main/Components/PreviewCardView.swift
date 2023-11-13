//
//  PreviewCardView.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

struct PreviewCardView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: ViewModel
    @State private var selected: Int = 0
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    // MARK: - Body
    var body: some View {
        TabView(selection: $selected) {
            
            ForEach(viewModel.filterPartners) { partner in
                GeometryReader { reader in
                    if let project = partner.projects.first {
                        NavigationLink(destination: ProjectView(pictures: project.pictures, selectedProject: project)) {
                            Image(project.pictures[0].imageURL)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: width, height: height - 200)
                                .offset(x: -reader.frame(in: .global).minX)
                                .overlay {
                                    OverlayView(partner: partner)
                                }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .frame(height: height - 200)
                .cornerRadius(20)
                .shadow(color: .second.opacity(0.2), radius: 10)
                .padding(.horizontal)
            }
        }
        .navigationBarBackButtonHidden()
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    
    // MARK: Method Gradient
    @ViewBuilder
    func OverlayView(partner: Partner) -> some View {
        ZStack(alignment: .bottom) {
            LinearGradient(colors: [
                .clear,
                .clear,
                .clear,
                .clear,
                .clear,
                .black.opacity(0.3),
                .black.opacity(0.7)
            ], startPoint: .top, endPoint: .bottom)
            
            NavigationLink(destination: PartnerView(model: partner)) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(partner.brandName)
                            .font(.system(size: 25, weight: .regular, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.titleFont)
                        
                        Text(partner.city)
                            .font(.subheadline)
                            .foregroundColor(.titleFont)
                    }
                    Spacer()
                    Image(partner.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(lineWidth: 2)
                                .foregroundColor(.titleFont)
                        }
                        .offset(x: -45)
                }
                .padding(20)
            }
        }
    }
}


struct PreviewCard_Previews: PreviewProvider {
    static var previews: some View {
        PreviewCardView()
            .environmentObject(ViewModel(service: NetworkManager()))
    }
}
