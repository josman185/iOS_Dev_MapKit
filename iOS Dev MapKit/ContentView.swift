//
//  ContentView.swift
//  iOS Dev MapKit
//
//  Created by Jose Vargas on 1/13/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var restrooms: [Restroom] = []

    private func loadData() async {
        do {
            restrooms = try await NetworkManager.shared.fetchData(at: AppConstants.API.restroomsAPiUrl)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        Map {
            ForEach(restrooms) { restroom in
                Marker(restroom.name, coordinate: restroom.coordinate)
            }
        }
        .task {
            await loadData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
