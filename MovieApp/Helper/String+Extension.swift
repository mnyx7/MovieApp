//
//  String+Extension.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 02.05.23.
//

import Foundation
extension String {
    var localize: String {
        let lang = UserDefaults.standard.string(forKey: "appLang")
        let path = Bundle.main.path(forResource: lang, ofType: "lproj") ?? ""
        let bundle = Bundle(path: path) ?? Bundle()
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
