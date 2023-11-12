//
//  SearchFilterBar.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

struct SearchAndFilterBar: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
    @Binding var searchPartner: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            // MARK: Searching View
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.second)
                
                TextField("Search", text: $searchPartner)
                    .font(.caption)
                    .foregroundColor(.font)
                    .accentColor(.second)
                
                Spacer()
                
                // MARK: Clear Button
                Button {
                    if !searchPartner.isEmpty {
                        searchPartner = ""
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .foregroundColor(.second)
                }
            }
            .padding()
            .overlay {
                Capsule()
                    .stroke(lineWidth: 0.3)
                    .foregroundColor(.second)
                    .shadow(color: .black.opacity(0.3), radius: 4)
            }
        }
    }
}

// MARK: - Preview
struct SearchAndFilterBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchAndFilterBar(searchPartner: .constant(""))
    }
}


