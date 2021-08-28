//
//  InformationViewController.swift
//  CatCalendar
//
//  Created by Sakiko Watanabe on 2021/08/14.
//

import UIKit
import Firebase
import SVProgressHUD

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
    
    var postData: PostData!
    var infoData: InfoData?
    var getDate: String!
    
    var conditionImageNo: Int = 0
    var appetiteImageNo: Int = 0
    var foodImageNo: Int = 0
    var peeImageNo: Int = 0
    var pooImageNo: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    //詳細画面上部の日付の表示
    dateLabel.text = self.getDate
        
        
        //保存されたinfoDataの取得
        //一度登録されたものの一覧を表示させる指示
        if let infoData = infoData {
            self.memoTextField.text = "\(infoData.caption!)"
            
            self.conditionImageNo = infoData.conditionImageNo
            //conditionImageNoの内容 → goodBtn、normalBtn、badBtnそれぞれのisEnabledを設定
            //詳細入力画面に登録されたInfoDataが渡された時、それぞれのボタン状態も登録したときと同じ状態にするため
            switch conditionImageNo {
                case 0:  // Good
                    goodBtn.isEnabled = false
                    normalBtn.isEnabled = true
                    badBtn.isEnabled = true

                case 1:  // Normal
                    goodBtn.isEnabled = true
                    normalBtn.isEnabled = false
                    badBtn.isEnabled = true

                case 2: // Bad
                    goodBtn.isEnabled = true
                    normalBtn.isEnabled = true
                    badBtn.isEnabled = false

                default:
                    goodBtn.isEnabled = true
                    normalBtn.isEnabled = true
                    badBtn.isEnabled = true
            }
            
            //食欲
            self.appetiteImageNo = infoData.appetiteImageNo
            switch appetiteImageNo {
            case 0:  //　○
                okBtn.isEnabled = false
                triangleBtn.isEnabled = true
                noBtn.isEnabled = true
                
            case 1:  //　△
                okBtn.isEnabled = true
                triangleBtn.isEnabled = false
                noBtn.isEnabled = true
                
            case 2:  //　×
                okBtn.isEnabled = true
                triangleBtn.isEnabled = true
                noBtn.isEnabled = false
                
            default:
                okBtn.isEnabled = true
                triangleBtn.isEnabled = true
                noBtn.isEnabled = true
            }
            
            //ご飯の種類
            self.foodImageNo = infoData.foodImageNo
            self.foodImageNo = infoData.foodImageNo
            switch foodImageNo {
            case 0:  //　wet
                wetFoodBtn.isEnabled = false
                dryFoodBtn.isEnabled = true
                mixFoodBtn.isEnabled = true
                
            case 1:  //　△
                wetFoodBtn.isEnabled = true
                dryFoodBtn.isEnabled = false
                mixFoodBtn.isEnabled = true
                
            case 2:  //　×
                wetFoodBtn.isEnabled = true
                dryFoodBtn.isEnabled = true
                mixFoodBtn.isEnabled = false
                
            default:
                wetFoodBtn.isEnabled = true
                dryFoodBtn.isEnabled = true
                mixFoodBtn.isEnabled = true
            }
            
            //おしっこの回数
            self.peeImageNo = infoData.peeImageNo
            self.peeImageNo = infoData.peeImageNo
            switch peeImageNo {
            case 0:  //　1つ選択
                peeFirstBtn.isEnabled = false
                peeSecondBtn.isEnabled = true
                peeThirdBtn.isEnabled = true
                peeForthBtn.isEnabled = true
                peeOtherBtn.isEnabled = true
            case 1:  //　2つ選択
                peeFirstBtn.isEnabled = false
                peeSecondBtn.isEnabled = false
                peeThirdBtn.isEnabled = true
                peeForthBtn.isEnabled = true
                peeOtherBtn.isEnabled = true
            case 2:  //　3つ選択
                peeFirstBtn.isEnabled = false
                peeSecondBtn.isEnabled = false
                peeThirdBtn.isEnabled = false
                peeForthBtn.isEnabled = true
                peeOtherBtn.isEnabled = true
            case 3: //4つ選択
                peeFirstBtn.isEnabled = false
                peeSecondBtn.isEnabled = false
                peeThirdBtn.isEnabled = false
                peeForthBtn.isEnabled = false
                peeOtherBtn.isEnabled = true
            case 4: //その他選択
                peeFirstBtn.isEnabled = true
                peeSecondBtn.isEnabled = true
                peeThirdBtn.isEnabled = true
                peeForthBtn.isEnabled = true
                peeOtherBtn.isEnabled = false
                
            default:
                peeFirstBtn.isEnabled = true
                peeSecondBtn.isEnabled = true
                peeThirdBtn.isEnabled = true
                peeForthBtn.isEnabled = true
                peeOtherBtn.isEnabled = true
            }
            
            
            self.pooImageNo = infoData.pooImageNo
            self.pooImageNo = infoData.pooImageNo
            switch pooImageNo {
            case 0:  //　1つ選択
                pooFirstBtn.isEnabled = false
                pooSecondBtn.isEnabled = true
                pooThirdBtn.isEnabled = true
                pooForthBtn.isEnabled = true
                pooOtherBtn.isEnabled = true
            case 1:  //　2つ選択
                pooFirstBtn.isEnabled = false
                pooSecondBtn.isEnabled = false
                pooThirdBtn.isEnabled = true
                pooForthBtn.isEnabled = true
                pooOtherBtn.isEnabled = true
            case 2:  //　3つ選択
                pooFirstBtn.isEnabled = false
                pooSecondBtn.isEnabled = false
                pooThirdBtn.isEnabled = false
                pooForthBtn.isEnabled = true
                pooOtherBtn.isEnabled = true
            case 3: //4つ選択
                pooFirstBtn.isEnabled = false
                pooSecondBtn.isEnabled = false
                pooThirdBtn.isEnabled = false
                pooForthBtn.isEnabled = false
                pooOtherBtn.isEnabled = true
            case 4: //その他選択
                pooFirstBtn.isEnabled = true
                pooSecondBtn.isEnabled = true
                pooThirdBtn.isEnabled = true
                pooForthBtn.isEnabled = true
                pooOtherBtn.isEnabled = false
                
            default:
                pooFirstBtn.isEnabled = true
                pooSecondBtn.isEnabled = true
                pooThirdBtn.isEnabled = true
                pooForthBtn.isEnabled = true
                pooOtherBtn.isEnabled = true
            }
        }
    }
    
    //体調ボタン
    @IBAction func goodBtn(_ sender: Any) {
        goodBtn.isEnabled = false
        normalBtn.isEnabled = true
        badBtn.isEnabled = true
        appetiteImageNo = 0
    }
    @IBAction func normalBtn(_ sender: Any) {
        goodBtn.isEnabled = true
        normalBtn.isEnabled = false
        badBtn.isEnabled = true
        appetiteImageNo = 1
    }
    @IBAction func badBtn(_ sender: Any) {
        goodBtn.isEnabled = true
        normalBtn.isEnabled = true
        badBtn.isEnabled = false
        conditionImageNo = 3
    }
    
    //食欲ボタン
    @IBAction func okBtn(_ sender: Any) {
        okBtn.isEnabled = false
        triangleBtn.isEnabled = true
        noBtn.isEnabled = true
        conditionImageNo = 0
    }
    @IBAction func triangleBtn(_ sender: Any) {
        okBtn.isEnabled = true
        triangleBtn.isEnabled = false
        noBtn.isEnabled = true
        conditionImageNo = 1
    }
    @IBAction func notBtn(_ sender: Any) {
        okBtn.isEnabled = true
        triangleBtn.isEnabled = true
        noBtn.isEnabled = false
        conditionImageNo = 2
    }
    
    //ご飯の種類
    @IBAction func wetFoodBtn(_ sender: Any) {
        wetFoodBtn.isEnabled = false
        dryFoodBtn.isEnabled = true
        mixFoodBtn.isEnabled = true
        foodImageNo = 0
    }
    @IBAction func dryFoodBtn(_ sender: Any) {
        wetFoodBtn.isEnabled = true
        dryFoodBtn.isEnabled = false
        mixFoodBtn.isEnabled = true
        foodImageNo = 1
    }
    @IBAction func mixFoodBtn(_ sender: Any) {
        wetFoodBtn.isEnabled = true
        dryFoodBtn.isEnabled = true
        mixFoodBtn.isEnabled = false
        foodImageNo = 2
    }
    
    //おしっこの回数
    @IBAction func peeFirstBtn(_ sender: Any) {
        peeFirstBtn.isEnabled = false
        peeSecondBtn.isEnabled = true
        peeThirdBtn.isEnabled = true
        peeForthBtn.isEnabled = true
        peeOtherBtn.isEnabled = true
        peeImageNo = 0
    }
    @IBAction func peeSecondBtn(_ sender: Any) {
        peeFirstBtn.isEnabled = false
        peeSecondBtn.isEnabled = false
        peeThirdBtn.isEnabled = true
        peeForthBtn.isEnabled = true
        peeOtherBtn.isEnabled = true
        peeImageNo = 2
    }
    @IBAction func peeThirdBtn(_ sender: Any) {
        peeFirstBtn.isEnabled = false
        peeSecondBtn.isEnabled = false
        peeThirdBtn.isEnabled = false
        peeForthBtn.isEnabled = true
        peeOtherBtn.isEnabled = true
        peeImageNo = 3
    }
    @IBAction func peeForthBtn(_ sender: Any) {
        peeFirstBtn.isEnabled = false
        peeSecondBtn.isEnabled = false
        peeThirdBtn.isEnabled = false
        peeForthBtn.isEnabled = false
        peeOtherBtn.isEnabled = true
        peeImageNo = 4
    }
    @IBAction func peeOtherBtn(_ sender: Any) {
        peeFirstBtn.isEnabled = true
        peeSecondBtn.isEnabled = true
        peeThirdBtn.isEnabled = true
        peeForthBtn.isEnabled = true
        peeOtherBtn.isEnabled = false
        peeImageNo = 5
    }
    
    //うんち回数ボタン
    @IBAction func pooFirstBtn(_ sender: Any) {
        pooFirstBtn.isEnabled = false
        pooSecondBtn.isEnabled = true
        pooThirdBtn.isEnabled = true
        pooForthBtn.isEnabled = true
        pooOtherBtn.isEnabled = true
        pooImageNo = 0
    }
    @IBAction func pooSecondBtn(_ sender: Any) {
        pooFirstBtn.isEnabled = false
        pooSecondBtn.isEnabled = false
        pooThirdBtn.isEnabled = true
        pooForthBtn.isEnabled = true
        pooOtherBtn.isEnabled = true
        pooImageNo = 1
    }
    @IBAction func pooThirdBtn(_ sender: Any) {
        pooFirstBtn.isEnabled = false
        pooSecondBtn.isEnabled = false
        pooThirdBtn.isEnabled = false
        pooForthBtn.isEnabled = true
        pooOtherBtn.isEnabled = true
        pooImageNo = 2
    }
    @IBAction func pooForthBtn(_ sender: Any) {
        pooFirstBtn.isEnabled = false
        pooSecondBtn.isEnabled = false
        pooThirdBtn.isEnabled = false
        pooForthBtn.isEnabled = false
        pooOtherBtn.isEnabled = true
        pooImageNo = 3
    }
    @IBAction func pooOtherBtn(_ sender: Any) {
        pooFirstBtn.isEnabled = true
        pooSecondBtn.isEnabled = true
        pooThirdBtn.isEnabled = true
        pooForthBtn.isEnabled = true
        pooOtherBtn.isEnabled = false
        pooImageNo = 4
    }
    
    
    
    @IBAction func createInfo(_ sender: Any) {
    // 投稿データの保存場所を定義する
        let infoRef = Firestore.firestore().collection(Const.PostPath).document(postData.id).collection(Const.InfoPath).document(self.getDate)
        // HUDで投稿処理中の表示を開始
        SVProgressHUD.show()
        
        // FireStoreに投稿データを保存する
        //日付の情報必要
        let infoDic = [
            "caption": self.memoTextField.text!,
            "conditionImageNo": self.conditionImageNo,
            "appetiteImageNo": self.appetiteImageNo,
            "foodImageNo": self.foodImageNo,
            "peeImageNo": self.peeImageNo,
            "pooImageNo": self.pooImageNo,
            
        ] as [String : Any]
        infoRef.setData(infoDic)
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "登録しました")

        // 登録後 前画面に戻る
        // 投稿処理が完了したので先頭画面に戻る
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
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
