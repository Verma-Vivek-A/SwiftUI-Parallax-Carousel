//
//  Home.swift
//  Parallax Carousel
//
//  Created by PC on 08/10/24.
//

import SwiftUI

// MARK: Take horizontal images for card
struct Home: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                    TextField("Search", text: self.$searchText)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(.ultraThinMaterial, in: Capsule())
                
                Text("Where do you want to travel?")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                GeometryReader(content: { geometry in
                    let size = geometry.size
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            
                            ForEach(Array(tripCards.enumerated()), id: \.1.id) { index, card in
                                
                                GeometryReader(content: { proxy in
                                    let cardSize = proxy.size
                                    
                                    let minX = min(((proxy.frame(in: .scrollView).minX - 30) * 1.4), (proxy.size.width * 1.4))
                                    
                                    Image(card.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .offset(x: -minX)
                                        .frame(width: cardSize.width * 2.5)
                                        .frame(width: cardSize.width, height: cardSize.height)
                                        .overlay(content: {
                                            OverlayView(card)
                                        })
                                        .clipShape(.rect(cornerRadius: 15))
                                        .shadow(color: .black.opacity(0.5), radius: 8, x: 5, y: 10)
                                })
                                .offset(x: 30)
                                .frame(width: size.width - 60, height: size.height - 50)
                                .padding(.trailing, index == (tripCards.count - 1) ? 60 : 0)
                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                    view
                                        .scaleEffect(phase.isIdentity ? 1 : 0.95)
                                }
                                
                            }
                            
                        }
                        .scrollTargetLayout()
                        .frame(height: size.height, alignment: .top)
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                })
                .frame(height: 500)
                .padding(.horizontal, -15)
                .padding(.top, 10)
                
            }
            .padding(15)
        }
        .scrollIndicators(.hidden)
    }
    
    func OverlayView(_ card: TripCard) -> some View {
        ZStack(alignment: .bottomLeading, content: {
            LinearGradient(colors: [
                .clear,
                .clear,
                .clear,
                .clear,
                .clear,
                .clear,
                .black.opacity(0.1),
                .black.opacity(0.3),
                .black.opacity(0.6)
            ], startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(card.name)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                
                Text(card.name)
                    .font(.callout)
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding(20)
        })
    }
    
}

#Preview {
    Home()
}
