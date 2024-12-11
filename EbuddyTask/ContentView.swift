//
//  ContentView.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    let buildNumber: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! \(buildNumber)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
