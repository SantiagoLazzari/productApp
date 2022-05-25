//
//  SessionManager.swift
//  ProductApp
//
//  Created by Bruno Fontes on 21/5/22.
//

import Foundation

enum Site: String {
    case uy = "MLU"
    case ar = "MLA"
}

class SessionManager {
    static var shared: SessionManager = .init()
    private var site: Site?
    
    var siteCode: String {
        guard let site = site else { return "" }
        return site.rawValue
    }

    func configure(site: Site) {
        self.site = site
    }
}
