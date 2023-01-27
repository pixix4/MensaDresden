//
//  RawRepresentable.swift
//  MensaDresden
//
//  Created by Lars Westermann on 27.01.23.
//  Copyright © 2023 Kilian Koeltzsch. All rights reserved.
//

import Foundation

extension Array: RawRepresentable where Element == String {
    public init?(rawValue: String) {
        self = rawValue.components(separatedBy: "💔")
    }

    public var rawValue: String {
        self.joined(separator: "💔")
    }
}

extension Date: RawRepresentable {
    public var rawValue: String {
        self.timeIntervalSinceReferenceDate.description
    }
    
    public init?(rawValue: String) {
        self = Date(timeIntervalSinceReferenceDate: Double(rawValue) ?? 0.0)
    }
}
