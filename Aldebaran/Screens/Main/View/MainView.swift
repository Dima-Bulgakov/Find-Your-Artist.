//
//  MainView.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @EnvironmentObject var viewModel: ViewModel
    @State private var isShowAllPartners = false
    
    // MARK: - Body
    var body: some View {
        
        NavigationStack {
            
            VStack {
                // MARK: SearchingView and ShowAllDesignersButton
                HStack {
                    SearchAndFilterBar(searchPartner: $viewModel.searchPartners)
                    ShowAllPartnersButton(isShowAllPartners: $isShowAllPartners)
                }
                .padding(.horizontal)
                
                // MARK: Designers or  AllDesignsView
                if isShowAllPartners {
                    PartnersView()
                } else {
                    PreviewCardView()
                }
            }
            .background(Color.main)
        }
        .navigationDestination(for: Partner.self) { partner in
            PartnerView(model: partner)
        }
    }
}

// MARK: - Preview
struct AllDesignsView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewModel(service: NetworkManager()))
    }
}
