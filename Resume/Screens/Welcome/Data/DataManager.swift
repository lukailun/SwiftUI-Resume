//
//  DataManager.swift
//  Resume
//
//  Created by 陆凯伦 on 2022/5/1.
//

import Combine
import Foundation

final class DataManager {
    private let fileName: String
    private let parser: DataParserProtocol

    init(fileName: String, parser: DataParserProtocol = DataParser()) {
        self.fileName = fileName
        self.parser = parser
    }

    func fetchData<T: Decodable>() throws -> T {
        guard let path = Bundle.main.path(forResource: fileName, ofType: parser.typeName) else {
            throw FileError.fileNotExist
        }
        let url = URL(fileURLWithPath: path)
        guard let data = try? Data(contentsOf: url),
              let object: T = try? parser.parse(data: data)
        else {
            throw FileError.invalidJSON
        }
        return object
    }
}
