//
//  NetworkError.swift
//  LoremPicsumApp
//
//  Created by Kesh Gurung on 11/07/2022.
//

import Foundation

enum NetworkError: Error {
    case badData
    case badURL
    case other(Error)
}
