//
//  CardBabeView.swift
//  EbuddyTask
//
//  Created by brian on 12/12/24.
//

import SwiftUI

struct CardBabeView: View {
    let name:String
    let imageUrl:String
    let isActive:Bool
    let isVerified:Bool
    let rate:String
    let count:String
    let price:String
    let hour:String
    let onClickFABVoice:() -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(name)
                    .font(
                        Font.inter(size: 16)
                            .weight(.bold)
                    )
                Circle()
                    .fill(Color("ActiveColor"))
                    .frame(width: 8, height: 8)
                
                Spacer()
                
                if isVerified {
                    Image("verified")
                }
                
                Image("instagram")
            }
            .padding([.leading, .trailing], 8)
            .frame(height:24, alignment: .leading)
            
            ZStack(alignment: .top) {
                AsyncImage(
                    url: URL(string: imageUrl)
                ) { phase in
                    switch phase {
                    case .failure:
                        Image("UserDummy")
                            .resizable()
                            .font(.largeTitle)
                    case .success(let image):
                        image
                            .resizable()
                    default:
                        ProgressView()
                    }
                }
                .scaledToFill()
                .frame(width: 158, height: 180)
                .clipShape(.rect(cornerRadius: 16))
                
                
                VStack {
                    ButtonAvailableToday(action: {})
                        .padding(.top, 6)
                        .frame(alignment: .top)
                    
                    Spacer()
                    
                    HStack {
                        GameIconView(count: 3)
                        
                        Spacer()
                        
                        FABVoice(action: onClickFABVoice)
                    }
                }
                .padding([.leading, .trailing], 8)
            }
            .frame(width: 158, height: 200)
            .padding(.top, 12)
            
            
            VStack(alignment: .leading, spacing: 8) {
                RatingView(rate: rate, count: count)
                PriceView(price: price, hour: hour)
            }
            .padding(4)
            
        }
        .padding([.top, .bottom], 8)
        .padding([.leading, .trailing], 4)
        .frame(width:166, height: 312, alignment: .top)
        .background(Color(UIColor.systemBackground))
        .clipShape(.rect(cornerRadius: 16))
    }
}

#Preview {
    VStack {
        CardBabeView(
            name:"Zynx",
            imageUrl: "https://finalfantasy7remake.wiki.fextralife.com/file/Final-Fantasy-7-Remake/aerith-gainborough-playable-character-ff7remake-wiki-guide-small.jpg",
            isActive: true,
            isVerified: true,
            rate: "4.9",
            count: "61",
            price: "110.00",
            hour: "1Hr",
            onClickFABVoice: {}
        )
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.gray)
}
