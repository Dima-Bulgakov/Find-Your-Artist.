//
//  ContentView.swift
//  Aldebaran
//
//  Created by Dima on 12.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView()
            .environmentObject(ViewModel(service: NetworkManager())) // Добавьте эту строку
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel(service: NetworkManager()))
    }
}
