//
//  TyphoGraphy.swift
//  EbuddyTask
//
//  Created by brian on 12/12/24.
//

import Foundation
import SwiftUI

extension Font {
    public static func helveticaNeue(size:CGFloat = 12) -> Font {
        return Font
            .custom("HelveticaNeue", size: size)
    }
    
    public static func inter(size:CGFloat = 12) -> Font {
        return Font
            .custom("Inter", size: size)
    }
}

#Preview {
    VStack {
        Text("HelveticaNeue")
            .font(Font.helveticaNeue(size: 24))
        
        Text("Inter")
            .font(Font.inter(size:24))
    }
    
}
