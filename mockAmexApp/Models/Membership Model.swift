//
//  Membership Model.swift
//  mockAmexApp
//
//  Created by Joshua Mandelson on 11/10/25.
//

import Foundation

struct MembershipCard: Identifiable {
    var id = NSUUID().uuidString

    let title: String
    let picture: String
}
