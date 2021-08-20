//
//  CalendarViewController.swift
//  CatCalendar
//
//  Created by Sakiko Watanabe on 2021/08/14.
//

import UIKit

class CatSettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // タイトル文字列の設定
        self.navigationItem.title = "ねこちゃん登録"
        
        // ナビゲーションバーの透明化
        // 半透明の指定（デフォルト値）
        self.navigationController?.navigationBar.isTranslucent = true
        // 空の背景画像設定
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        // ナビゲーションバーの影画像（境界線の画像）を空に設定
        self.navigationController!.navigationBar.shadowImage = UIImage()
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
