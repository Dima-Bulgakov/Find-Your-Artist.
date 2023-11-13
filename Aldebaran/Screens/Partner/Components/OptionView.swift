//
//  OptionView.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

struct OptionsView: View {
    
    // MARK: - Properties
    let model: Partner
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(model.options) { option in
                HStack {
                    Image(systemName: option.picture)
                    Text(option.title)
                }
                .font(.subheadline)
                .foregroundColor(.font)
            }
        }
        .padding()
    }
}

// MARK: - Preview
struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView(model: PartnerData.shared.partners[3])
    }
}
