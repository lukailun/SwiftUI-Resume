//
//  ResumeApp.swift
//  Resume
//
//  Created by 陆凯伦 on 2022/4/29.
//

import SwiftUI

@main
struct ResumeApp: App {
    @StateObject var viewModel = ResumeAppViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.isLaunching {
                LaunchView()
                    .transition(.opacity.animation(.easeInOut(duration: 2)))
            } else {
                Text("111")
            }
        }
    }
}
