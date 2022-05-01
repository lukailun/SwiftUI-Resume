//
//  UIBezierPath+.swift
//  Resume
//
//  Created by 陆凯伦 on 2022/4/30.
//

import UIKit

extension UIBezierPath {
    static func calculateBounds(paths: [UIBezierPath]) -> CGRect {
        let path = UIBezierPath()
        paths.forEach { it in
            path.append(it)
        }
        return path.bounds
    }

    static var M: UIBezierPath {
        let bezierPath = UIBezierPath()
        guard let letters: Letters = try? DataManager(fileName: "Letters").fetchData() else {
            return bezierPath
        }
        let M = letters.M
        M.forEach { bezierPath.handle(withStep: $0) }
        return bezierPath
    }
    
    static var e: UIBezierPath {
        let bezierPath = UIBezierPath()
        guard let letters: Letters = try? DataManager(fileName: "Letters").fetchData() else {
            return bezierPath
        }
        let e = letters.e
        e.forEach { bezierPath.handle(withStep: $0) }
        return bezierPath
    }

    private func handle(withStep step: LetterStep) {
        switch step.key {
        case .point:
            guard let params = step.params else {
                return
            }
            move(to: CGPoint(x: params.endPoint.x, y: params.endPoint.y))
        case .curve:
            guard let params = step.params,
                  let controlPoint1 = params.controlPoint1,
                  let controlPoint2 = params.controlPoint2
            else {
                return
            }
            addCurve(to: CGPoint(x: params.endPoint.x, y: params.endPoint.y), controlPoint1: CGPoint(x: controlPoint1.x, y: controlPoint1.y), controlPoint2: CGPoint(x: controlPoint2.x, y: controlPoint2.y))
        case .line:
            guard let params = step.params else {
                return
            }
            addLine(to: CGPoint(x: params.endPoint.x, y: params.endPoint.y))
        case .close:
            close()
        }
    }
}
