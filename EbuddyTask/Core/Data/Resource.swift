//
//  Resource.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import Foundation

enum Resource<T> {
    case success(T)
    case failed(String)
}
