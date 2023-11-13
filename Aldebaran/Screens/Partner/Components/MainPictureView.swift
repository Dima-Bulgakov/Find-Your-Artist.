//
//  MainPictureView.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

struct MainPictureView: View {
    
    // MARK: - Properties
    let model: Partner
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Properties
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            // MARK: Main Image
            Image(model.logo)
                .resizable()
                .scaledToFill()
                .overlay {
                    OverlayView(designer: model)
                }
            
            // MARK: Back Button
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.font)
                    .background(
                        Circle()
                            .fill(Color.main)
                            .frame(width: 40, height: 40)
                    )
                    .padding(30)
                    .padding(.top, 36)
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    // MARK: Method Gradient
    @ViewBuilder
    func OverlayView(designer: Partner) -> some View {
        ZStack(alignment: .bottom) {
            LinearGradient(colors: [
                .clear,
                .clear,
                .clear,
                .clear,
                .clear,
                .black.opacity(0.3),
                .black.opacity(0.65)
            ], startPoint: .top, endPoint: .bottom)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(designer.brandName)
                        .font(.system(size: 25, weight: .regular, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.titleFont)
                    
                    Text(designer.city)
                        .font(.subheadline)
                        .foregroundColor(.titleFont)
                }
                Spacer()
            }
            .padding()
        }
    }
}


struct MainPictureView_Previews: PreviewProvider {
    static var previews: some View {
        MainPictureView(model: PartnerData.shared.partners[3])
            .scaledToFit()
    }
}
