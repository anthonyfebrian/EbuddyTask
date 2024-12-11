//
//  Result.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import Foundation

enum Result<T> {
    case loading
    case success(T)
    case failed(String)
}
