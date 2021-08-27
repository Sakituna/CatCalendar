//
//  InformationViewController.swift
//  CatCalendar
//
//  Created by Sakiko Watanabe on 2021/08/14.
//

import UIKit
import Firebase

class InformationViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var goodBtn: UIButton!
    @IBOutlet weak var normalBtn: UIButton!
    @IBOutlet weak var badBtn: UIButton!
    
    @IBOutlet weak var appetiteLabel: UILabel!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var triangleBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var wetFoodBtn: UIButton!
    @IBOutlet weak var dryFoodBtn: UIButton!
    @IBOutlet weak var mixFoodBtn: UIButton!
    
    @IBOutlet weak var peeLabel: UILabel!
    @IBOutlet weak var peeFirstBtn: UIButton!
    @IBOutlet weak var peeSecondBtn: UIButton!
    @IBOutlet weak var peeThirdBtn: UIButton!
    @IBOutlet weak var peeForthBtn: UIButton!
    @IBOutlet weak var peeOtherBtn: UIButton!
    
    @IBOutlet weak var pooLabel: UILabel!
    @IBOutlet weak var pooFirstBtn: UIButton!
    @IBOutlet weak var pooSecondBtn: UIButton!
    @IBOutlet weak var pooThirdBtn: UIButton!
    @IBOutlet weak var pooForthBtn: UIButton!
    @IBOutlet weak var pooOtherBtn: UIButton!
    
    @IBOutlet weak var memoLabel: UILabel!
    @IBOutlet weak var memoTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    //ボタンがタップされた時に呼ばれるメソッド
    
    
    // PostDataの内容を表示
    func setPostData(_ postData: PostData) {
        // 体調ボタンの表示
        if postData.isGood {
            let buttonImage = UIImage(named: "good")
            self.goodBtn.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "good_none")
            self.goodBtn.setImage(buttonImage, for: .normal)
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
