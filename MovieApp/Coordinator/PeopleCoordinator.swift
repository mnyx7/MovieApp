//
//  PeopleCoordinator.swift
//  MovieApp
//
//  Created by Minaya Yagubova on 08.05.23.
//

import Foundation
import UIKit

class PeopleCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showPeopleMoviesController(id: Int) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(ActorMoviesController.self)") as! ActorMoviesController
        vc.viewModel.id = id
        navigationController.show(vc, sender: nil)
    }
}
