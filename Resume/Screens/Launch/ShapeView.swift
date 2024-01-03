//
//  ShapeView.swift
//  Resume
//
//  Created by 陆凯伦 on 2022/4/30.
//

import SwiftUI

struct ShapeView: Shape {
    let path: Path
    let pathBounds: CGRect

    func path(in rect: CGRect) -> Path {
        let pointScale = rect.width >= rect.height ? max(pathBounds.height, pathBounds.width) : min(pathBounds.height, pathBounds.width)
        let pointTransform = CGAffineTransform(scaleX: 1 / pointScale, y: 1 / pointScale)
        let path = path.applying(pointTransform)
        let multiplier = min(rect.width, rect.height)
        let transform = CGAffineTransform(scaleX: multiplier, y: multiplier)
        return path.applying(transform)
    }
}
