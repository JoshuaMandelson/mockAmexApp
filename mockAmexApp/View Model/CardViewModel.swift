//
//  CardViewModel.swift
//  mockAmexApp
//
//  Created by Joshua Mandelson on 11/1/25.
//

import Foundation
import SwiftUI
internal import Combine

class CardViewModel: ObservableObject {
    @Published var card = [Card]()
    
    func fetchCard() {
        self.card = [
            .init(name: "Business Blue Plus Card", picture: "Blue", primaryColor: Color(red: 0.0, green: 0.0, blue: 0.2), secondaryColor: Color(red: 0.0, green: 0.196, blue: 0.392)),
            .init(name: "Amex Green Card", picture: "Green", primaryColor: Color(red: 0.0, green: 0.3, blue: 0.2), secondaryColor: Color(red: 70/255, green: 170/255, blue: 100/255)),
            .init(name: "Amex Gold Card", picture: "Gold", primaryColor: Color(red: 0.55, green: 0.43, blue: 0.1), secondaryColor: Color(red: 0.83, green: 0.69, blue: 0.22)),
            .init(name: "Marriott Bonvoy Card", picture: "Bonvoy", primaryColor: Color(red: 0.1, green: 0.1, blue: 0.1), secondaryColor: Color(red: 0.15, green: 0.15, blue: 0.17)),
            .init(name: "Amex Platinum Card", picture: "Platinum", primaryColor: Color(red: 0.45, green: 0.46, blue: 0.48), secondaryColor: Color(red: 0.6, green: 0.6, blue: 0.62))

        ]
    }
}
