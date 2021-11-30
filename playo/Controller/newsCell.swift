//
//  newsCell.swift
//  playo
//
//  Created by Lov Niveria on 30/11/21.
//

import UIKit

class newsCell: UITableViewCell {

    @IBOutlet weak var NewsImage: UIImageView!
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
