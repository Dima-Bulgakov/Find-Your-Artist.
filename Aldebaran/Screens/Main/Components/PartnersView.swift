//
//  PartnersView.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

struct PartnersView: View {

    // MARK: - Properties
    @EnvironmentObject var viewModel: ViewModel
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]

    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.filterPartners) { item in
                    NavigationLink(destination: PartnerView(model: item)) {
                        VStack {
                            Image(item.logo)
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width / 3 - 10, height: 100)
                                .clipShape(Circle())
                                .overlay {
                                    Circle().stroke(lineWidth: 2)
                                        .foregroundColor(.font)
                                }
                            Text(item.brandName)
                                .foregroundColor(.font)
                                .font(.subheadline)
                        }
                        .padding(.top, 10)
                    }
                }
            }
            .padding(.top)
            .padding(.horizontal, 10)
        }
    }
}


struct Designers_Previews: PreviewProvider {
    static var previews: some View {
        PartnersView()
            .environmentObject(ViewModel(service: NetworkManager()))
    }
}
