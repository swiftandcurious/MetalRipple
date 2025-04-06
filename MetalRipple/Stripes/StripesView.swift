//
//  StripesView.swift
//  MetalRipple
//
//  Created by swiftandcurious on 4/5/25.
//

import SwiftUI

struct StripesView: View {
    let stripes = ShaderLibrary.Stripes(
        .float(20),
        .colorArray([
            .red, .orange, .yellow, .green, .blue, .purple
        ])
    )
    
    var body: some View {
        VStack {
            
            Text("Stripes Modifier")
                .font(.title.bold())
            
            Text("Pride")
                .font(.system(size: 144, weight: .bold))
                .foregroundStyle(stripes)
            
            Circle()
                .fill(stripes)
                .padding(16)
            
            Spacer()
        }
    }
}

#Preview {
    StripesView()
}
