//
//  APIClientTests.swift
//  ToDoTests
//
//  Created by Enjel Hutasoit on 23/05/25.
//

import Foundation
import XCTest
@testable import ToDo

final class APIClientTests: XCTestCase {
    
    func test_Login_UsesExpectedHost() {
        let sut = APIClient()
    }
}

extension APIClientTests {
    
    class MockURLSession {
        
        var url: URL?
        
        func dataTask(
            with url: URL,
            completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
        ) -> URLSessionTask {
            self.url = url
            return URLSession.shared.dataTask(with: url)
        }
    }
}
