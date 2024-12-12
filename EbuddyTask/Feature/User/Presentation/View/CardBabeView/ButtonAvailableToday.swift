//
//  ButtonAvailableToday.swift
//  EbuddyTask
//
//  Created by brian on 12/12/24.
//

import SwiftUI

struct ButtonAvailableToday: View {
    private let action:() -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        Button(
            action: action,
            label:{
                Image("lightning")
                Text("Available today!")
                    .foregroundColor(Color.white)
                    .font(
                        Font.helveticaNeue(size: 12)
                    )
            }
        )
        .padding([.top, .bottom], 6)
        .padding([.leading, .trailing], 12)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
    }
}

#Preview {
    VStack {
        ButtonAvailableToday {
            
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.gray)
}
