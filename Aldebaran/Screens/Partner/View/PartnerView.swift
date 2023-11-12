//
//  PartnerView.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

struct PartnerView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: ViewModel
    let model: Partner
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack {
                
                // MARK: MainPictureView
                MainPictureView(model: model)
                
                VStack(alignment: .leading) {
                    
                    // MARK: About
                    AboutView(model: model)
                                        
                    // MARK: Projects
                    ProjectsView(model: model)
                    
                    // MARK: Options
                    OptionsView(model: model)
                }
            }
        }
        .background(Color.main)
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        
        // MARK: Bottom Static Panel
        .overlay(alignment: .bottom) {
            BottomStaticPanel(model: model)
        }
    }
}

struct DesignerView_Previews: PreviewProvider {
    static var previews: some View {
        PartnerView(model: PartnerData.shared.partners[3])
            .environmentObject(ViewModel(service: NetworkManager()))
    }
}
