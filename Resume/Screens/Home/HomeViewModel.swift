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
    private let backgroundImageCount = 7
    private let bioIndexSubject = CurrentValueSubject<Int, Never>(0)
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var content = ""
    @Published private(set) var backgroundImageName = ""
    @Published private(set) var style = BubbleStyle.single
    @Published private(set) var width = 260
    
    private var contents: [String] = []
    
    private var sharePublisher: Publishers.Share<CurrentValueSubject<Int, Never>> {
        bioIndexSubject.share()
    }

    init(dataManager: DataManager) {
        self.dataManager = dataManager
        fetchContents()
        addContentSubscription()
        addBackgroundImageSubscription()
    }

    private func fetchContents() {
        guard let contents: [String] = try? dataManager.fetchData() else {
            return
        }
        self.contents = contents
    }
    
    private func addContentSubscription() {
        sharePublisher
            .map { [contents] index in contents[index] }
            .receive(on: RunLoop.main)
            .sink { [weak self] content in
                self?.content = content
            }
            .store(in: &cancellables)
    }
    
    private func addBackgroundImageSubscription() {
        sharePublisher
            .map { [contents, backgroundImageCount] index in index / Int(ceil(Double(contents.count) / Double(backgroundImageCount))) }
            .receive(on: RunLoop.main)
            .sink { [weak self] backgroundImageIndex in
                self?.backgroundImageName = "backgroundImage/\(backgroundImageIndex)"
            }
            .store(in: &cancellables)
    }
}

extension HomeViewModel {
    var isPreviousEnabled: Bool {
        bioIndexSubject.value > 0
    }

    var isNextEnabled: Bool {
        bioIndexSubject.value < contents.count - 1
    }
    
    func next() {
        guard isNextEnabled else {
            return
        }
        bioIndexSubject.send(bioIndexSubject.value + 1)
    }

    func previous() {
        guard isPreviousEnabled else {
            return
        }
        bioIndexSubject.send(bioIndexSubject.value - 1)
    }

    func reset() {
        bioIndexSubject.send(0)
    }
}
