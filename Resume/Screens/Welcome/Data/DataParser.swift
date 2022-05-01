//
//  DataParser.swift
//  Resume
//
//  Created by 陆凯伦 on 2022/5/1.
//

import Foundation

class DataParser: DataParserProtocol {
    let typeName = "json"
    private let jsonDecoder: JSONDecoder

    init(jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.jsonDecoder = jsonDecoder
        self.jsonDecoder.keyDecodingStrategy = .useDefaultKeys
    }

    func parse<T: Decodable>(data: Data) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
}
