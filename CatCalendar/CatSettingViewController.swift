//
//  CalendarViewController.swift
//  CatCalendar
//
//  Created by Sakiko Watanabe on 2021/08/14.
//

import UIKit
import Firebase
import SVProgressHUD

class CatSettingViewController: UIViewController {
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    @IBOutlet weak var catNameTextField: UITextField!
    @IBOutlet weak var catBirthDayTextField: UITextField!
    @IBOutlet weak var catBreedsTextField: UITextField!
    
    //アイコン画像の値
    var imageNo: Int = 0
    var postData: PostData!
    
    //左アイコン
    @IBAction func firstBtn(_ sender: Any) {
        firstBtn.isEnabled = false
        secondBtn.isEnabled = true
        thirdBtn.isEnabled = true
        imageNo = 0
    }
    
    //真ん中アイコン
    @IBAction func secondBtn(_ sender: Any) {
        firstBtn.isEnabled = true
        secondBtn.isEnabled = false
        thirdBtn.isEnabled = true
        imageNo = 1
    }
    
    //右アイコン
    @IBAction func thirdBtn(_ sender: Any) {
        firstBtn.isEnabled = true
        secondBtn.isEnabled = true
        thirdBtn.isEnabled = false
        imageNo = 2
    }
    
    //登録ボタン
    @IBAction func createCatBtn(_ sender: Any) {
        // 投稿データの保存場所を定義する
        let postRef = Firestore.firestore().collection(Const.PostPath).document()
        // HUDで投稿処理中の表示を開始
        SVProgressHUD.show()
        
        // FireStoreに投稿データを保存する
        let postDic = [
            "catName": self.catNameTextField.text!,
            "birthday": self.catBirthDayTextField.text!,
            "catBreed": self.catBreedsTextField.text!,
            "imageNo": self.imageNo
        ] as [String : Any]
        postRef.setData(postDic)
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "登録しました")
        // 投稿処理が完了したので先頭画面に戻る
        // 登録後 前画面に戻る
        self.navigationController?.popViewController(animated: true)
    }

//キャンセルボタン
@IBAction func cancelBtn(_ sender: Any) {
    // 一つ前の画面に戻る
    self.dismiss(animated: true, completion: nil)
}


override func viewDidLoad() {
    super.viewDidLoad()
    
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
