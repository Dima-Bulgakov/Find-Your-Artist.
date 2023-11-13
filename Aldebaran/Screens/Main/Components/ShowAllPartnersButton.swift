//
//  ShowAllPartnersButton.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

struct ShowAllPartnersButton: View {
    
    @Binding var isShowAllPartners: Bool
    
    var body: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.5)) {
                isShowAllPartners.toggle()
            }
        } label: {
            Image(systemName: "circle.grid.3x3.fill")
                .font(.title)
                .foregroundColor(.second)
        }
        .padding(.leading)
    }
}

struct ShowAllPartnersButton_Previews: PreviewProvider {
    static var previews: some View {
        ShowAllPartnersButton(isShowAllPartners: .constant(true))
    }
}
