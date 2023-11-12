//
//  ViewModel.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var partners = [Partner]()
    @Published var showAlert = false
    @Published var searchPartners = ""
    
    private let service: NetworkManager
    var filterPartners: [Partner] {
        guard !searchPartners.isEmpty else { return partners }
        return partners.filter { $0.brandName.localizedCaseInsensitiveContains(searchPartners) }
    }
    
    // MARK: - Initializer
    init(service: NetworkManager) {
        self.service = service
        Task { await fetchListings() }
    }
    
    // MARK: - Methods
    func fetchListings() async {
        do {
            let fetchedPartners = try await service.fetchPartners()
            DispatchQueue.main.async {
                self.partners = fetchedPartners
            }
        } catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    // MARK: Media
    func handleMediaTap(media: Media) {
        switch media {
        case .telegram:
            openURL("https://web.telegram.org")
        case .instagram:
            openURL("https://instagram.com")
        case .phone:
            showAlert = true
        case .website:
            openURL("https://www.archdaily.com")
        }
    }
    
    func openURL(_ url: String) {
        if let url = URL(string: url) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    func phoneActionSheet() -> ActionSheet {
        return ActionSheet(
            title: Text("Do you want to make a call?"),
            buttons: [.cancel(),
                      .default(Text("Call 0(50) 355 50 07"), action: {})])
    }
}
