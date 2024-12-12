//
//  FABVoice.swift
//  EbuddyTask
//
//  Created by brian on 12/12/24.
//

import SwiftUI

struct FABVoice: View {
    private let action:() -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    var body: some View {
        Button(
            action:action,
            label: {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [
                                        Color("ButtonVoice1"),
                                        Color("ButtonVoice2"),
                                        Color("ButtonVoice3")
                                    ]
                                ),
                                startPoint: .bottomLeading,
                                endPoint: .topTrailing)
                        )
                        .frame(width: 40, height: 40)
                    
                    Image("voice")
                }
            }
        )
    }
}

#Preview {
    FABVoice{}
}
