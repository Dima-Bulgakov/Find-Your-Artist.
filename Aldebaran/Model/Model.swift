//
//  Model.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

// MARK: Designer Model
struct Partner: Identifiable, Codable, Hashable {
    let id: String
    let brandName: String
    let logo: String
    let description: String
    let experience: Int
    let city: String
    var media: [Media]
    var options: [Options]
    var projects: [Project]
}

// MARK: Project Model
struct Project: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let description: String
    let square: Double
    let totalPricePerMeter: Int
    let year: Int
    let location: String
    let pictures: [Picture]
}

// MARK: Picture Model
struct Picture: Identifiable, Codable, Hashable {
    var id = UUID().uuidString
    var imageURL: String
}

// MARK: Options Enum
enum Options: Int, Codable, Identifiable, Hashable {
    case supervision
    case designing
    
    var id: Int { return self.rawValue }
    
    var title: String {
        switch self {
        case .supervision: return "Author Supervision"
        case .designing: return "Designing"
        }
    }
    
    var picture: String {
        switch self {
        case .supervision: return "person.badge.key"
        case .designing: return "pencil.line"
        }
    }
}

enum Media: Int, Codable, Identifiable, Hashable {
    case telegram
    case instagram
    case phone
    case website
    
    var id: Int { return self.rawValue }
    
    var picture: String {
        switch self {
        case .telegram: return "telegram"
        case .instagram: return "instagram"
        case .phone: return "phone"
        case .website: return "web"
        }
    }
}
