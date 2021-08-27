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
    @IBOutlet weak var catBirthdayLabel: UILabel!
    @IBOutlet weak var catBreedsLabel: UILabel!
    
    var selectRowNo: String = ""
    
    
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
        if postData.imageNo == 0 {
           self.catImageView.image = UIImage(named: "mike")
        } else if postData.imageNo == 1 {
            self.catImageView.image = UIImage(named: "kuro")
        } else if postData.imageNo == 2 {
            self.catImageView.image = UIImage(named: "shiro")
        }
            
        // ねこの名前表示
        self.catNameLabel.text = "\(postData.catName!)"
        // 誕生日の表示
        self.catBirthdayLabel.text = "\(postData.birthday!)"
        // 種類の表示
        self.catBreedsLabel.text = "\(postData.catBreed!)"
        }
}
