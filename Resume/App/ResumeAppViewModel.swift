//
//  ResumeAppViewModel.swift
//  Resume
//
//  Created by 陆凯伦 on 2023/1/14.
//

import Combine
import Foundation

class ResumeAppViewModel: ObservableObject {
    @Published var isLaunching = true

    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isLaunching = false
        }
    }
}
