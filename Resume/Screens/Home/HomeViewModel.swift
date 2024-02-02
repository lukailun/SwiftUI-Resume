//
//  HomeViewModel.swift
//  Resume
//
//  Created by lukailun on 2023/1/17.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    private let dataManager: DataManager
    @Published private var contentIndex = 0
    @Published private var backgroundImageIndex = 0
    @Published private(set) var style = DialogueStyle.single
    @Published private(set) var isBackgroundImageChanging = false
    
    private var contents: [String] = []

    var content: String {
        if contents.isEmpty || contentIndex >= contents.count {
            return ""
        }
        return contents[contentIndex]
    }
    
    var backgroundImageName: String {
        if contents.isEmpty || contentIndex >= contents.count {
            return ""
        }
        return "backgroundImage/\(backgroundImageIndex)"
    }

    var isPreviousEnabled: Bool {
        contentIndex > 0
    }

    var isNextEnabled: Bool {
        contentIndex < contents.count - 1
    }

    init(dataManager: DataManager) {
        self.dataManager = dataManager
        fetchContents()
    }

    private func fetchContents() {
        guard let contents: [String] = try? dataManager.fetchData() else {
            return
        }
        self.contents = contents
    }
}

extension HomeViewModel {
    func next() {
        guard isNextEnabled else {
            return
        }
        contentIndex += 1
        backgroundImageIndex += 1
    }

    func previous() {
        guard isPreviousEnabled else {
            return
        }
        contentIndex -= 1
        backgroundImageIndex -= 1
    }

    func reset() {
        contentIndex = 0
        backgroundImageIndex = 0
    }
}
