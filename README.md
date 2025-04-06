# Metal: Apple’s Framework That Rocks Your GPU 🤘

Welcome to **MetalRipples**, a code-along project demonstrating how to create custom visual effects with Apple's Metal framework and SwiftUI. In this project, you'll learn how to leverage Metal shaders to produce eye-catching effects such as a dynamic ripple effect and colorful stripes. Whether you're building games, visualizing data, or creating stunning animations, this project shows you how to access your device’s GPU for fast, smooth rendering.

The app will look the following:

![[MetalRippleDemo_small_round.gif]]

## Overview

This project is divided into two main parts:

1. Stripes Shader:
   A simple Metal shader that produces horizontal color stripes (inspired by the Pride flag). This effect demonstrates how to use custom Metal shaders in SwiftUI to render per-pixel visual effects.

2. Ripple Effect: 
   A more interactive effect that simulates the ripples created by dropping a stone in water. The ripple effect is triggered by user taps on an image. It uses a custom Metal shader combined with SwiftUI animations to create a ripple that propagates outward from the touch point.

## What You'll Explore

- Introduction to Metal:
  Understand the basics of Metal and how it provides low-level access to the GPU for both graphics and compute tasks.

- Custom Metal Shaders:  
  Learn how to write and integrate Metal shader code (`.metal` files) with SwiftUI for visual effects.

- SwiftUI & Metal Integration:
  Discover how to combine SwiftUI animations with Metal shaders using custom view modifiers and keyframe animation.

- User Interaction: 
  Implement gesture detection (using a UIKit-based gesture recognizer) and integrate it into SwiftUI to drive animations.


## Getting Started

### Prerequisites

- **Xcode 14 or later:**  
  Make sure you have the latest version of Xcode installed.

- **iOS 16 or later:**  
  The project uses SwiftUI and Metal features available on newer versions of iOS.

### Setup

1. Clone the Repository:
   ```bash
   git clone https://github.com/yourusername/MetalRipples.git
   cd MetalRipples
   ```
2. Open the Project: Open `MetalRipples.xcodeproj` in Xcode.
3. Build and Run: Select a simulator or a physical device and press **Cmd + R** to build and run the project.

## Code-Along Walkthrough

### 1. Metal Shaders

- Stripes.metal:  
	  Implements a simple shader to display horizontal stripes. The shader calculates a stripe index based on the pixel’s y-position and uses a color array provided by SwiftUI to render each stripe.
- Ripple.metal: 
	  Implements the ripple effect by calculating the distance from the touch point, delaying the ripple for pixels further away, and using a sine wave combined with exponential decay to generate the ripple’s displacement. The shader then samples a new pixel position based on this calculation and subtly adjusts the pixel’s color to enhance the effect.
    

### 2. SwiftUI Integration

- RippleModifier.swift: 
    A view modifier that bridges the animation timing with the Metal shader. It passes the current touch location (`origin`), elapsed time, and ripple parameters (amplitude, frequency, decay, speed) to the Metal shader to compute the visual effect.
    
- RippleEffect.swift:
    Orchestrates the ripple animation by applying a keyframe animator. It listens for changes (via a trigger such as a counter) and starts the animation that updates the elapsed time, feeding these values into the `RippleModifier`.
    
- SpatialPressing.swift:
    Contains the custom gesture recognizer (`SpatialPressingGesture`) built on UIKit and a SwiftUI view modifier (`SpatialPressingGestureModifier`) that captures the touch location and updates the view’s state. This location is used to set the ripple’s origin.
    
- RippleEffectView.swift:
    Combines everything by displaying an image and attaching the custom gesture modifier to capture user taps. When a tap is detected, it updates the origin and triggers the ripple animation using the `RippleEffect` modifier.
    

### 3. Putting It All Together

The final UI is built using a `TabView` in `ContentView.swift`, which allows you to switch between the Stripes view and the Ripple effect view. This demonstrates how multiple Metal shaders and effects can coexist in a single app.

## Resources

- [Apple Developer Documentation - SwiftUI Visual Effects](https://developer.apple.com/documentation/SwiftUI/Creating-visual-effects-with-SwiftUI)
    
- [Metal Shading Language Guide](https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf)
    

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

Happy coding! Let your creativity and curiosity drive you to explore more of what Metal and SwiftUI can do.