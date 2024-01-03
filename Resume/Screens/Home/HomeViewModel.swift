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
    @Published private var index = 0
    @Published private(set) var style = DialogueStyle.single
    private var contents: [String] = []

    var content: String {
        if contents.isEmpty || index >= contents.count {
            return ""
        }
        return contents[index]
    }

    var isPreviousEnabled: Bool {
        index > 0
    }

    var isNextEnabled: Bool {
        index < contents.count - 1
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
        index += 1
    }

    func previous() {
        guard isPreviousEnabled else {
            return
        }
        index -= 1
    }

    func reset() {
        index = 0
    }
}
