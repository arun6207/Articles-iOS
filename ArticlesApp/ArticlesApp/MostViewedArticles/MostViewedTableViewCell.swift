//
//  MostViewedTableViewCell.swift
//  ArticlesApp
//
//  Created by Arun Amuri on 20/02/2021.
//

import UIKit
import ArticlesCore

class MostViewedTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var bylineLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(viewModel: MostViewedCellViewModel) {
        titleLabel.text = viewModel.title
        abstractLabel.text = viewModel.abstract
        bylineLabel.text = viewModel.byline
        publishedDateLabel.text = viewModel.displayDate
    }
}

