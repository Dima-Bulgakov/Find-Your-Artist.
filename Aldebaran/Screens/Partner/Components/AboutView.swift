//
//  AboutView.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

struct AboutView: View {
    
    // MARK: - Properties
    let model: Partner
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Text("About")
                .font(.headline)
                .padding(.bottom, 8)
            Text(model.description)
                .font(.subheadline)
        }
        .foregroundColor(.font)
        .padding(.top)
        .padding(.horizontal)
    }
}

// MARK: - Preview
struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(model: PartnerData.shared.partners[3])
    }
}
