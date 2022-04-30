//
//  Font+CustomFont.swift
//  Resume
//
//  Created by 陆凯伦 on 2022/4/30.
//

import SwiftUI

extension Font {
    static func muyaoFont(size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font {
        .custom("Muyao-Softbrush", size: size, relativeTo: textStyle)
    }
}
