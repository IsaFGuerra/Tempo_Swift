//
//  tempoApp.swift
//  tempo
//
//  Created by Isadora Guerra on 30/10/23.
//

import SwiftUI

@main
struct tempoApp: App {
    var body: some Scene {
        WindowGroup {
            TempoCidades(location: Location(back: "sunny", city: "Punta Cana", time: "09:30", temp: "27º", max: "10", min: "10", tempString: "sunny"))
        }
    }
}
