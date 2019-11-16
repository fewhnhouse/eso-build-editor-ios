//
//  Network.swift
//  ESO Build Editor
//
//  Created by Felix Wohnhaas on 13.11.19.
//  Copyright © 2019 Felix Wohnhaas. All rights reserved.
//

import Foundation
import Apollo

// MARK: - Singleton Wrapper

class Apollo {
  static let shared = Apollo()
    init() {
        apollo.cacheKeyForObject = { $0["id"] }
    }
  // Configure the network transport to use the singleton as the delegate.
  private lazy var networkTransport = HTTPNetworkTransport(
    url: URL(string: "https://eso-build-backend.fewhnhouse.de")!,
    delegate: self
  )
    
  // Use the configured network transport in your Apollo client.
    private(set) lazy var apollo = ApolloClient(networkTransport: self.networkTransport)
}

// MARK: - Pre-flight delegate

extension Apollo: HTTPNetworkTransportPreflightDelegate {

  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          shouldSend request: URLRequest) -> Bool {
    // If there's an authenticated user, send the request. If not, don't.
    return true
  }
  
  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                        willSend request: inout URLRequest) {
                        
    // Get the existing headers, or create new ones if they're nil
    var headers = request.allHTTPHeaderFields ?? [String: String]()

    // Add any new headers you need
    headers["Authorization"] = "Bearer \("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjanppNzM1YXoxNDU1MDc3Nm92MWE5cjloIiwiaWF0IjoxNTczNjU1NDEwfQ.H6jJGZPr_x4Qh58kQ9plwZsIwG9chouosbtjPy9chnc")"
  
    // Re-assign the updated headers to the request.
    request.allHTTPHeaderFields = headers
    
    Logger.log(.debug, "Outgoing request: \(request)")
  }
}

// MARK: - Task Completed Delegate

extension Apollo: HTTPNetworkTransportTaskCompletedDelegate {
  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                        didCompleteRawTaskForRequest request: URLRequest,
                        withData data: Data?,
                        response: URLResponse?,
                        error: Error?) {
    Logger.log(.debug, "Raw task completed for request: \(request)")
                        
    if let error = error {
      Logger.log(.error, "Error: \(error)")
    }
    
    if let response = response {
      Logger.log(.debug, "Response: \(response)")
    } else {
      Logger.log(.error, "No URL Response received!")
    }
    
    if let data = data {
      Logger.log(.debug, "Data: \(String(describing: String(bytes: data, encoding: .utf8)))")
    } else {
      Logger.log(.error, "No data received!")
    }
  }
}

// MARK: - Retry Delegate

extension Apollo: HTTPNetworkTransportRetryDelegate {

  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                        receivedError error: Error,
                        for request: URLRequest,
                        response: URLResponse?,
                        retryHandler: @escaping (_ shouldRetry: Bool) -> Void) {
    return
  }
}
