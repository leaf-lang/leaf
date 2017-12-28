//
//  Leaf.swift
//  LeafCore
//
//  Created by Peter Entwistle on 18/12/2017.
//  Copyright © 2017 Peter Entwistle. All rights reserved.
//

import Foundation

public final class Leaf {
    private let arguments: [String]
    
    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    public func run() throws {
        let tokens = Lexer.lex(data: arguments[0])
    }
}
