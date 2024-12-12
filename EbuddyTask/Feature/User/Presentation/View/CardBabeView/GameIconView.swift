//
//  GameIconView.swift
//  EbuddyTask
//
//  Created by brian on 12/12/24.
//

import SwiftUI

struct GameIconView: View {
    let count:Int?
    private let diameter = 40.0
    private let gameOffsetX = -8.0
    
    var body: some View {
        HStack(spacing: 0) {
            Image("GameDummy1")
                .resizable()
                .scaledToFill()
                .clipShape(.circle)
                .frame(width: diameter, height: diameter)
            
            Image("GameDummy2")
                .resizable()
                .scaledToFill()
                .clipShape(.circle)
                .frame(width: diameter, height: diameter)
                .offset(x: gameOffsetX)
                .overlay {
                    ZStack {
                        Circle()
                            .fill(
                                Color("GameOverlay")
                            )
                            .stroke(Color("GameBorder"))
                        
                        if let count = count {
                            Text("+\(count)")
                                .foregroundColor(Color("GameCount"))
                                .font(.system(size: 14))
                        }
                    }
                    .offset(x: gameOffsetX)
                }
        }
    }
}

#Preview {
    GameIconView(count: 3)
}
