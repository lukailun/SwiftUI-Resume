//
//  LetterStepParams.swift
//  Resume
//
//  Created by 陆凯伦 on 2022/5/1.
//

struct LetterStepParams: Decodable {
    let endPoint: LetterStepParamsPoint
    let controlPoint1: LetterStepParamsPoint?
    let controlPoint2: LetterStepParamsPoint?
}
