//
//  CultureTableViewCell.swift
//  Elo7Native
//
//  Created by Mauricio  Olimpio on 18/08/17.
//  Copyright © 2017 Mauricio  Olimpio. All rights reserved.
//

import UIKit

class CultureTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageTitle: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLebal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(data:CultureModelItem)  {
        
        let imageURL = URL(string: data.image)
        self.imageTitle.kf.setImage(with: imageURL, options: [.transition(.fade(0.3))])
        self.title.text = data.title
        let atributedString = String("<font face='Roboto-Regular' size='5'><center>" + data.description + "</font>").htmlAttributedString()
        self.descriptionLebal.attributedText = atributedString
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
