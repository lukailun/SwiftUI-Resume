//
//  LaunchView.swift
//  Resume
//
//  Created by 陆凯伦 on 2022/4/30.
//

import SwiftUI

struct LaunchView: View {
    @State private var endTrim: CGFloat = 0
    @State private var isFilled = false
    private let pathBounds = UIBezierPath.calculateBounds(paths: [.letters.M, .letters.e])
    var body: some View {
        ZStack {
            Color(.red).ignoresSafeArea()
            HStack(alignment: .bottom, spacing: 0) {
                VStack(alignment: .trailing, spacing: 0) {
                    Spacer()
                    ZStack {
                        ShapeView(bezierPath: .letters.M, pathBounds: pathBounds)
                            .trim(from: 0, to: endTrim)
                            .stroke(Color.black, lineWidth: 2)
                            .offset(x: 15)
                        ShapeView(bezierPath: .letters.M, pathBounds: pathBounds)
                            .fill(Color.white.opacity(isFilled ? 1 : 0))
                            .offset(x: 15)
                    }
                    .frame(width: 150, height: 150)
                    Spacer()
                }
                VStack(alignment: .trailing, spacing: 0) {
                    Spacer()
                    ZStack {
                        ShapeView(bezierPath: .letters.e, pathBounds: pathBounds)
                            .trim(from: 0, to: endTrim)
                            .stroke(Color.black, lineWidth: 2)
                            .offset(y: 40)
                        ShapeView(bezierPath: .letters.e, pathBounds: pathBounds)
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

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
