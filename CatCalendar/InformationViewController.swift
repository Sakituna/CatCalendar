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
    var infoData: InfoData!
    var getDate: String!
    
    var conditionImageNo: Int = 0
    var appetiteImageNo: Int = 0
    var foodImageNo: Int = 0
    var peeImageNo: Int = 0
    var pooImageNo: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
        pooFirstBtn.isEnabled = true
        pooSecondBtn.isEnabled = false
        pooThirdBtn.isEnabled = true
        pooForthBtn.isEnabled = true
        pooOtherBtn.isEnabled = true
        pooImageNo = 1
    }
    @IBAction func pooThirdBtn(_ sender: Any) {
        pooFirstBtn.isEnabled = true
        pooSecondBtn.isEnabled = true
        pooThirdBtn.isEnabled = false
        pooForthBtn.isEnabled = true
        pooOtherBtn.isEnabled = true
        pooImageNo = 2
    }
    @IBAction func pooForthBtn(_ sender: Any) {
        pooFirstBtn.isEnabled = true
        pooSecondBtn.isEnabled = true
        pooThirdBtn.isEnabled = true
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
        
        
        //詳細入力画面への画面遷移
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        //HomeViewControllerへinfoDataの受け渡し
        homeViewController.infoData = self.infoData
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
