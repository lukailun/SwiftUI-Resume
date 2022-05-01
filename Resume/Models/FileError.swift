//
//  FileError.swift
//  Resume
//
//  Created by 陆凯伦 on 2022/5/1.
//

enum FileError: Error, CustomStringConvertible {
    case fileNotExist
    case invalidJSON

    var description: String {
        switch self {
        case .fileNotExist:
            return "文件不存在。"
        case .invalidJSON:
            return "无法将数据转为 JSON。"
        }
    }
}
