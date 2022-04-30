//
//  WelcomeView.swift
//  Resume
//
//  Created by 陆凯伦 on 2022/4/30.
//

import SwiftUI

struct WelcomeView: View {
    @State private var endTrim: CGFloat = 0
    @State private var isFilled = false
    private let pathBounds = UIBezierPath.calculateBounds(paths: [.letterM, .letterE])
    var body: some View {
        ZStack {
            Color(.red).ignoresSafeArea()
            HStack(alignment: .bottom, spacing: 0) {
                VStack(alignment: .trailing, spacing: 0) {
                    Spacer()
                    ZStack {
                        ShapeView(bezierPath: .letterM, pathBounds: pathBounds)
                            .trim(from: 0, to: endTrim)
                            .stroke(Color.black, lineWidth: 2)
                            .offset(x: 15)
                        ShapeView(bezierPath: .letterM, pathBounds: pathBounds)
                            .fill(Color.white.opacity(isFilled ? 1 : 0))
                            .offset(x: 15)
                    }
                    .frame(width: 150, height: 150)
                    Spacer()
                }
                VStack(alignment: .trailing, spacing: 0) {
                    Spacer()
                    ZStack {
                        ShapeView(bezierPath: .letterE, pathBounds: pathBounds)
                            .trim(from: 0, to: endTrim)
                            .stroke(Color.black, lineWidth: 2)
                            .offset(y: 40)
                        ShapeView(bezierPath: .letterE, pathBounds: pathBounds)
                            .fill(Color.white.opacity(isFilled ? 1 : 0))
                            .offset(y: 40)
                    }
                    .frame(width: 150, height: 150)
                    Spacer()
                }
            }
            .offset(x: 30)
            .onAppear {
                withAnimation(.easeInOut(duration: 2)) {
                    endTrim = 1
                }
                withAnimation(.easeInOut(duration: 2).delay(2)) {
                    isFilled = true
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
