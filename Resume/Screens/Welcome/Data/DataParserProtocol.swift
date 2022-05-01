//
//  DataParserProtocol.swift
//  Resume
//
//  Created by 陆凯伦 on 2022/5/1.
//

import Foundation

protocol DataParserProtocol {
    var typeName: String { get }
    func parse<T: Decodable>(data: Data) throws -> T
}
