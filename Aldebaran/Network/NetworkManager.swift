//
//  NetworkManager.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import Foundation

// MARK: - Service for fetching data
class NetworkManager {
    func fetchPartners() async throws -> [Partner] {
        return PartnerData.shared.partners
    }
}
