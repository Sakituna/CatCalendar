//
//  CatSelectingTableViewCell.swift
//  CatCalendar
//
//  Created by Sakiko Watanabe on 2021/08/18.
//

import UIKit
import FirebaseUI

class CatSelectingTableViewCell: UITableViewCell {
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var catNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // PostDataの内容をセルに表示
    func setPostData(_ postData: PostData) {
        // 画像の表示

        // ねこの名前表示
        self.catNameLabel.text = "\(postData.catName!)"
        }
}
