//
//  RatingView.swift
//  EbuddyTask
//
//  Created by brian on 12/12/24.
//

import SwiftUI

struct RatingView: View {
    let rate:String
    let count:String
    var body: some View {
        HStack(spacing: 4) {
            Image("star")
                .frame(width: 20, height: 20)
            
            Text(rate)
                .font(.system(size: 14))
                .fontWeight(.bold)
            
            Text("(\(count))")
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    RatingView(rate: "4.9", count: "61")
}
