//
//  RippleModifier.swift
//  MetalRipple
//
//  Created by swiftandcurious on 4/5/25.
//

import SwiftUI

struct RippleModifier: ViewModifier {
    
    var origin: CGPoint
    var elapsedTime: TimeInterval
    var duration: TimeInterval
    var amplitude: Double = 12
    var frequency: Double = 15
    var decay: Double = 8
    var speed: Double = 1200

    var maxSampleOffset: CGSize {
        CGSize(width: amplitude, height: amplitude)
    }

    func body(content: Content) -> some View {
        let shader = ShaderLibrary.Ripple(
                        .float2(origin),
                        .float(elapsedTime),
                        .float(amplitude),
                        .float(frequency),
                        .float(decay),
                        .float(speed)
                        )
        
        let maxSampleOffset = maxSampleOffset
        let elapsedTime = elapsedTime
        let duration = duration
        
        content.visualEffect { view, _ in
            view.layerEffect(
                shader,
                maxSampleOffset: maxSampleOffset,
                isEnabled: 0 < elapsedTime && elapsedTime < duration
            )
        }
    }
}
