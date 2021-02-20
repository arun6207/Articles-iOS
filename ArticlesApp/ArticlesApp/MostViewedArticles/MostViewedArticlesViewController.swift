//
//  MostViewedArticlesViewController.swift
//  ArticlesApp
//
//  Created by Arun Amuri on 20/02/2021.
//

import UIKit

class MostViewedArticlesViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    private var viewModel: MostViewedViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.tableFooterView = UIView()
        viewModel = MostViewedViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.loadMostViewedArticles(handler: { [weak self] (result) in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self?.tableview.reloadData()
                }
            case let .failure(error):
                print("error happened \(error)")
            }
        })
    }
}

extension MostViewedArticlesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "MostViewedTableViewCell") as? MostViewedTableViewCell
        guard let articles = viewModel?.articles else { return UITableViewCell() }
        cell?.configure(viewModel: MostViewedCellViewModel(article: articles[indexPath.row]))
        return cell ?? UITableViewCell()
    }
}
