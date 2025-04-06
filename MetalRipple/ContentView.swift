//
//  ContentView.swift
//  MetalRipple
//
//  Created by swiftandcurious on 4/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            StripesView()
                .tabItem {
                    Image(systemName: "text.justify")
                    Text("Stripes")
                }

            RippleEffectView()
                .tabItem {
                    Image(systemName: "wave.3.up")
                    Text("Ripples")
                }
        }
    }
}

#Preview {
    ContentView()
}
