//
//  PriceView.swift
//  EbuddyTask
//
//  Created by brian on 12/12/24.
//

import SwiftUI

struct PriceView: View {
    let price:String
    let hour:String
    
    var body: some View {
        HStack(spacing:4) {
            Image("fire")
                .frame(width: 20, height: 20)
            
            HStack(spacing:0) {
                Text("\(price)")
                    .font(.system(size: 16))
                    .bold()
                
                Text("/\(hour)")
                    .font(.system(size: 12))
            }
        }
    }
}

#Preview {
    PriceView(price: "110", hour: "1Hr")
}
