//
//  CardViewModel.swift
//  mockAmexApp
//
//  Created by Joshua Mandelson on 11/1/25.
//

import Foundation
import SwiftUI
internal import Combine

class MembershipViewModel: ObservableObject {
    @Published var membership = [MembershipCard]()
    
    func fetchCard() {
        self.membership = [
            .init(title: "Global Assist Hotline", picture: "callCenter"),
            .init(title: "Premium Car Rental Protection", picture: "car"),
            .init(title: "Pay With Rewards Points", picture: "pay"),
            .init(title: "Earn 2X Rewards Points", picture: "onPhone"),

        ]
    }
}
