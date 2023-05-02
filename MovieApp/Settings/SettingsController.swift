//
//  SettingsController.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 01.05.23.
//

import UIKit

class SettingsController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    func chaneLang(lang: String) {
        UserDefaults.standard.set(lang, forKey: "appLang")
        titleLabel.text = "Language changet to \(lang)"
    }
 
    @IBAction func azTapped(_ sender: Any) {
        chaneLang(lang: "az")
    }
    @IBAction func ruTapped(_ sender: Any) {
        chaneLang(lang: "ru")
    }
    @IBAction func enTapped(_ sender: Any) {
        chaneLang(lang: "en")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    



}
