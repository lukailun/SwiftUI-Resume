//
//  HomeViewModel.swift
//  Resume
//
//  Created by lukailun on 2023/1/17.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published private(set) var index = 0
    
    private var contents: [String] = []
    private var cancellables: Set<AnyCancellable> = []
    
    private var sharedPublisher: Publishers.Share<Published<Int>.Publisher> {
        $index.share()
    }
    
    var isPreviousEnabled: Bool {
        index > 0
    }
    
    var isNextEnabled: Bool {
        index < contents.count - 1
    }
    
    init() {
        fetchContents()
        if contents.isEmpty {
            return
        }
        setupContentsSubscription()
    }
    
    private func fetchContents() {
        guard let contents: [String] = try? DataManager(fileName: "Bio").fetchData() else {
            return
        }
        self.contents = contents
    }
    
    private func setupContentsSubscription() {
        sharedPublisher
            .map { [unowned self] in self.contents[$0] }
            .receive(on: RunLoop.main)
            .sink { content in
                print(content)
//                withAnimation(.easeInOut) {
//                    if chString.contains(",") {
//                        self?.multipleText.removeAll()
//                        self?.splitTextSubject.send(chString.components(separatedBy: ","))
//                        self?.style = .double
//                    } else {
//                        self?.singleText = chString
//                        self?.style = .single
//                    }
//                }
            }
            .store(in: &cancellables)
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
    
    func refresh() {
        index = 0
    }
}
