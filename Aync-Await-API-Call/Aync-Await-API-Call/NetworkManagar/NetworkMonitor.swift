//
//  NetworkMonitor.swift
//  Aync-Await-API-Call
//
//  Created by Arvind kumar Singh on 08/04/25.
//

import Network

class NetworkMonitor {
    static let shared = NetworkMonitor()
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue.global(qos: .background)
    private(set) var isConnected: Bool = false

    private init() {}

    func startMonitoring() {
        Task {
            for await path in monitor {
                self.isConnected = path.status == .satisfied
                if self.isConnected {
                    print("Network is available.")
                } else {
                    print("Network is unavailable.")
                }
            }
        }
        monitor.start(queue: queue)
    }

    func stopMonitoring() {
        monitor.cancel()
    }
}
