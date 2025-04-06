//
//  Stripes.metal
//  MetalRipple
//
//  Created by swiftandcurious on 4/5/25.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI.h>
using namespace metal;

[[ stitchable ]]
half4 Stripes(
    float2 position,
    float thickness,
    device const half4 *ptr,
    int count
) {
    int i = int(floor(position.y / thickness));

    // Clamp to 0 ..< count.
    i = ((i % count) + count) % count;

    return ptr[i];
}
