//
//  AppDIContainer.swift
//  Cookbook
//
//  Created by Егор Бадмаев on 28.10.2022.
//

import Foundation
import Networking
//import Persistance

final class AppDIContainer {
    
    // MARK: - Public Properties
    
    public static let shared = AppDIContainer()
    
    // MARK: - Private Properties
    /// Core Data model's specified name.
//    private let coreDataContainerName = "Cookbook"
    /// `URLSessionConfiguration` for ``NetworkManager``.
    private let networkConfiguration = URLSessionConfiguration.default
    /// Network Manager. It is responsible for all network requests of this app.
    private lazy var networkManager: NetworkManagerProtocol = {
        var urlSession = URLSession(configuration: networkConfiguration)
        let networkManager = NetworkManager(session: urlSession)
        return networkManager
    }()
    /// Core Data Manager. It is responsible for all operations connected with persistance.
//    private lazy var coreDataManager: CoreDataManagerProtocol = CoreDataManager(containterName: coreDataContainerName)
    
    // MARK: - Init
    
    private init() {}
    
    // MARK: - Internal Methods
    
    /// Method that resolves and provides us ``NetworkManager`` object.
    /// - Returns: ``NetworkManager`` instance.
    func resolveNetworkManager() -> NetworkManagerProtocol {
        return networkManager
    }
    
//    func resolveCoreDataManager() -> CoreDataManagerProtocol {
//        return coreDataManager
//    }
}