//
//  TNEnvironment.swift
//  TermiNetwork
//
//  Created by Vasilis Panagiotopoulos on 14/02/2018.
//  Copyright © 2018 Vasilis Panagiotopoulos. All rights reserved.
//

import Foundation

public protocol TNEnvironmentProtocol {
    func configure() -> TNEnvironment
}

public enum TNURLScheme: String {
    case http
    case https
}

open class TNEnvironment {
    // MARK: - Properties
    var scheme: TNURLScheme
    var host: String
    var port: Int?
    var suffix: TNPath?
    var timeoutInterval: TimeInterval = 60

    // MARK: - Static members
    public static var current: TNEnvironment!
    
    public static func set(_ environment: TNEnvironmentProtocol) {
        current = environment.configure()
    }
    
    public static var verbose = false
        
    // MARK: - Initializers
    public init(scheme: TNURLScheme, host: String, suffix: TNPath?, port: Int?) {
        self.scheme = scheme
        self.host = host
        self.suffix = suffix
        self.port = port
    }
    
    public convenience init(scheme: TNURLScheme, host: String) {
        self.init(scheme: scheme, host: host, suffix: nil, port: nil)
    }
    
    public convenience init(scheme: TNURLScheme, host: String, port: Int) {
        self.init(scheme: scheme, host: host, suffix: nil, port: port)
    }
    
    public convenience init(scheme: TNURLScheme, host: String, suffix: TNPath) {
        self.init(scheme: scheme, host: host, suffix: suffix, port: nil)
    }
}


// MARK: - CustomStringConvertible
extension TNEnvironment: CustomStringConvertible {
    public var description: String {
        var urlComponents = [String]()
        urlComponents.append(scheme.rawValue + ":/")
        urlComponents.append(port != nil ? host + ":" + String(describing: port!) : host)
        
        if suffix != nil {
            urlComponents.append(suffix!.components.joined(separator: "/"))
        }
        
        return urlComponents.joined(separator: "/")
    }
}
