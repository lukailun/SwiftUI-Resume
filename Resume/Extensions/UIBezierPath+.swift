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

    static var letterM: UIBezierPath {
        let bezierPath = UIBezierPath()
        guard let letters: Letters = try? DataManager(fileName: "Letters").fetchData() else {
            return bezierPath
        }
        let M = letters.M
        M.forEach { bezierPath.handle(withStep: $0) }
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

    static var letterE: UIBezierPath {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 60.14, y: 1.38))
        bezierPath.addCurve(to: CGPoint(x: 22.84, y: 40.88), controlPoint1: CGPoint(x: 47.04, y: 5.38), controlPoint2: CGPoint(x: 33.34, y: 19.98))
        bezierPath.addCurve(to: CGPoint(x: 0.14, y: 131.38), controlPoint1: CGPoint(x: 10.24, y: 65.98), controlPoint2: CGPoint(x: 1.44, y: 101.08))
        bezierPath.addCurve(to: CGPoint(x: 16.14, y: 185.18), controlPoint1: CGPoint(x: -0.86, y: 154.68), controlPoint2: CGPoint(x: 3.34, y: 168.78))
        bezierPath.addCurve(to: CGPoint(x: 48.34, y: 208.88), controlPoint1: CGPoint(x: 26.84, y: 198.88), controlPoint2: CGPoint(x: 34.74, y: 204.68))
        bezierPath.addCurve(to: CGPoint(x: 93.74, y: 205.38), controlPoint1: CGPoint(x: 63.54, y: 213.48), controlPoint2: CGPoint(x: 79.04, y: 212.28))
        bezierPath.addCurve(to: CGPoint(x: 135.14, y: 148.38), controlPoint1: CGPoint(x: 111.04, y: 197.08), controlPoint2: CGPoint(x: 130.14, y: 170.78))
        bezierPath.addCurve(to: CGPoint(x: 133.24, y: 117.78), controlPoint1: CGPoint(x: 138.64, y: 132.58), controlPoint2: CGPoint(x: 138.14, y: 124.88))
        bezierPath.addCurve(to: CGPoint(x: 115.04, y: 109.38), controlPoint1: CGPoint(x: 129.24, y: 111.98), controlPoint2: CGPoint(x: 123.64, y: 109.38))
        bezierPath.addCurve(to: CGPoint(x: 104.74, y: 112.68), controlPoint1: CGPoint(x: 107.94, y: 109.38), controlPoint2: CGPoint(x: 107.54, y: 109.48))
        bezierPath.addCurve(to: CGPoint(x: 101.84, y: 118.48), controlPoint1: CGPoint(x: 103.14, y: 114.48), controlPoint2: CGPoint(x: 101.84, y: 117.08))
        bezierPath.addCurve(to: CGPoint(x: 99.24, y: 128.68), controlPoint1: CGPoint(x: 101.84, y: 119.88), controlPoint2: CGPoint(x: 100.64, y: 124.48))
        bezierPath.addCurve(to: CGPoint(x: 60.64, y: 167.88), controlPoint1: CGPoint(x: 91.84, y: 150.88), controlPoint2: CGPoint(x: 75.14, y: 167.88))
        bezierPath.addCurve(to: CGPoint(x: 46.24, y: 152.68), controlPoint1: CGPoint(x: 51.34, y: 167.88), controlPoint2: CGPoint(x: 47.24, y: 163.48))
        bezierPath.addCurve(to: CGPoint(x: 48.64, y: 127.68), controlPoint1: CGPoint(x: 45.54, y: 146.08), controlPoint2: CGPoint(x: 47.24, y: 129.08))
        bezierPath.addCurve(to: CGPoint(x: 55.84, y: 130.08), controlPoint1: CGPoint(x: 49.04, y: 127.28), controlPoint2: CGPoint(x: 52.34, y: 128.28))
        bezierPath.addCurve(to: CGPoint(x: 76.54, y: 132.48), controlPoint1: CGPoint(x: 63.84, y: 133.98), controlPoint2: CGPoint(x: 69.94, y: 134.68))
        bezierPath.addCurve(to: CGPoint(x: 91.84, y: 120.78), controlPoint1: CGPoint(x: 81.24, y: 130.98), controlPoint2: CGPoint(x: 91.84, y: 122.78))
        bezierPath.addCurve(to: CGPoint(x: 95.74, y: 115.08), controlPoint1: CGPoint(x: 91.84, y: 120.18), controlPoint2: CGPoint(x: 93.64, y: 117.68))
        bezierPath.addCurve(to: CGPoint(x: 115.14, y: 51.98), controlPoint1: CGPoint(x: 107.34, y: 101.08), controlPoint2: CGPoint(x: 114.84, y: 76.68))
        bezierPath.addCurve(to: CGPoint(x: 110.14, y: 25.18), controlPoint1: CGPoint(x: 115.24, y: 40.38), controlPoint2: CGPoint(x: 113.94, y: 33.18))
        bezierPath.addCurve(to: CGPoint(x: 93.14, y: 6.18), controlPoint1: CGPoint(x: 107.14, y: 18.68), controlPoint2: CGPoint(x: 99.04, y: 9.68))
        bezierPath.addCurve(to: CGPoint(x: 60.14, y: 1.38), controlPoint1: CGPoint(x: 83.24, y: 0.38), controlPoint2: CGPoint(x: 69.64, y: -1.62))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 70.54, y: 54.58))
        bezierPath.addCurve(to: CGPoint(x: 59.34, y: 92.38), controlPoint1: CGPoint(x: 69.44, y: 69.28), controlPoint2: CGPoint(x: 64.44, y: 85.98))
        bezierPath.addCurve(to: CGPoint(x: 57.54, y: 85.48), controlPoint1: CGPoint(x: 56.74, y: 95.68), controlPoint2: CGPoint(x: 55.84, y: 92.48))
        bezierPath.addCurve(to: CGPoint(x: 70.64, y: 45.88), controlPoint1: CGPoint(x: 60.34, y: 73.18), controlPoint2: CGPoint(x: 69.44, y: 45.88))
        bezierPath.addCurve(to: CGPoint(x: 70.54, y: 54.58), controlPoint1: CGPoint(x: 70.94, y: 45.88), controlPoint2: CGPoint(x: 70.84, y: 49.78))
        bezierPath.close()
        return bezierPath
    }
}
