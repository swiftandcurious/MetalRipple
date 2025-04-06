//
//  RippleEffectView.swift
//  MetalRipple
//
//  Created by swiftandcurious on 4/5/25.
//

import SwiftUI

struct RippleEffectView: View {
    
    @State var counter: Int = 0
    @State var origin: CGPoint = .zero
    
    var body: some View {
        
        VStack {
            Text("Ripple Effect")
                .font(.title.bold())
            
            Image("PalmTreeBeach")
                .resizable()
                .scaledToFit()
                .frame(width: 350)
                .cornerRadius(24)
                .onPressingChanged { point in
                    if let point {
                        origin = point
                        counter += 1
                    }
                }
                .modifier(RippleEffect(at: origin, trigger: counter))
                .shadow(radius: 5, x: 5, y: 5)
            
            Spacer()
        }
    }
}

extension View {
    func onPressingChanged(_ action: @escaping (CGPoint?) -> Void) -> some View {
        modifier(SpatialPressingGestureModifier(action: action))
    }
}

#Preview {
    RippleEffectView()
}
