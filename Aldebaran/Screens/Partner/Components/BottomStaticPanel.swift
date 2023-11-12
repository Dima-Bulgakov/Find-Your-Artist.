//
//  BottomStaticPanel.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

struct BottomStaticPanel: View {
    
    // MARK: - Priperties
    @EnvironmentObject var viewModel: ViewModel
    let model: Partner
    
    // MARK: - Body
    var body: some View {
        VStack {
            Divider()
                .padding(.bottom, 20)
            HStack(alignment: .center, spacing: 35) {
                ForEach(model.media) { media in
                    
                    Button {
                        viewModel.handleMediaTap(media: media)
                    } label: {
                        Image(media.picture)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.second)
                    }
                    .actionSheet(isPresented: $viewModel.showAlert) {
                        viewModel.phoneActionSheet()
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .background(Color.main)
    }
}

struct BottomStaticPanel_Previews: PreviewProvider {
    static var previews: some View {
        BottomStaticPanel(model: PartnerData.shared.partners[3])
            .environmentObject(ViewModel(service: NetworkManager()))
    }
}
