//
//  ViewController.swift
//  ArticlesApp
//
//  Created by Arun Amuri on 20/02/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = MostViewedViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.loadMostViewedArticles { (result) in
            switch result {
            case let .failure(error):
                print(error.localizedDescription)
            case let .success(feeds):
                print(feeds.count)
            }
        }
        
    }
    
    


}

