//
//  LoadingView.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import SwiftUI

struct LoadingIndicator: View {
    @State var isAnimating: Bool = true
    let color: Color = .gray
    
    var body: some View {
        ZStack {
            
            ForEach(0..<3) { index in
                Circle()
                    .scale(isAnimating ? 0.0 : 1.0)
                    .fill(color)
                    .opacity(isAnimating ? 1.0 : 0.0)
                    .animation(Animation.interpolatingSpring
                        .repeatForever(autoreverses: false)
                        .delay(Double(index) * 0.5 / 3)
                        .speed(0.7)
                               ,value: isAnimating)
            }
        }
        .onAppear() {
            isAnimating.toggle()
        }
    }
}

#Preview {
    LoadingIndicator()
}

