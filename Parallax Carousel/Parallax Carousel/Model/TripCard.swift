//
//  TripCard.swift
//  Parallax Carousel
//
//  Created by PC on 08/10/24.
//

import Foundation

struct TripCard: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let subtitle: String
    let image: String
}

var tripCards: [TripCard] = [TripCard(name: "Trip 1", subtitle: "Trip...", image: "trip1"),
                             TripCard(name: "Trip 2", subtitle: "Trip...", image: "trip2"),
                             TripCard(name: "Trip 3", subtitle: "Trip...", image: "trip3"),
                             TripCard(name: "Trip 4", subtitle: "Trip...", image: "trip4"),
                             TripCard(name: "Trip 5", subtitle: "Trip...", image: "trip5")]
