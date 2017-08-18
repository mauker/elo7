//
//  HeaderTableViewCell.swift
//  Elo7Native
//
//  Created by Mauricio  Olimpio on 18/08/17.
//  Copyright © 2017 Mauricio  Olimpio. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var imageTitle: UIImageView!
    @IBOutlet weak var imageBackGround: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(data:HeaderModel)  {
        let imagebackgroundURL = URL(string: data.background)
        
        self.imageBackGround.kf.setImage(with: imagebackgroundURL, options: [.transition(.fade(0.3))])
        
        let imageTitleURL = URL(string: data.image)
        
         self.imageTitle.kf.setImage(with: imageTitleURL, options: [.transition(.fade(0.3))])
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
