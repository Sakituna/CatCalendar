//
//  SelectCatViewController.swift
//  CatCalendar
//
//  Created by Sakiko Watanabe on 2021/08/14.
//

import UIKit
import Firebase

class CatSelectingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    // 投稿データを格納する配列
    var postArray: [PostData] = []

    // Firestoreのリスナー
    var listener: ListenerRegistration?
    
    var indexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self

        // カスタムセルを登録する
        let nib = UINib(nibName: "CatSelectingTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("DEBUG_PRINT: viewWillAppear")
        // ログイン済みか確認
        if Auth.auth().currentUser != nil {
            // listenerを登録して投稿データの更新を監視する
            let postsRef = Firestore.firestore().collection(Const.PostPath)
            listener = postsRef.addSnapshotListener() { (querySnapshot, error) in
                if let error = error {
                    print("DEBUG_PRINT: snapshotの取得が失敗しました。 \(error)")
                    return
                }
                // 取得したdocumentをもとにPostDataを作成し、postArrayの配列にする。
                self.postArray = querySnapshot!.documents.map { document in
                    print("DEBUG_PRINT: document取得 \(document.documentID)")
                    let postData = PostData(document: document)
                    return postData
                }
                // TableViewの表示を更新する
                self.tableView.reloadData()
                if self.indexPath != nil {
                    self.tableView.selectRow(at: self.indexPath!, animated: false, scrollPosition: .top)
                    let v2 = self.navigationController!.tabBarController!.viewControllers![1] as! HomeViewController
                    v2.postData = self.postArray[self.indexPath!.row]
                }
                
                if !self.postArray.isEmpty && self.indexPath == nil {
                //一番上のセルが最初から選択されている処理
                self.tableView.selectRow(at: [0,0], animated: false, scrollPosition: .top)
                    self.indexPath = [0,0]
                let v2 = self.navigationController!.tabBarController!.viewControllers![1] as! HomeViewController
                v2.postData = self.postArray[0]
                }
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("DEBUG_PRINT: viewWillDisappear")
        // listenerを削除して監視を停止する
        listener?.remove()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得してデータを設定する
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CatSelectingTableViewCell
        cell.setPostData(postArray[indexPath.row])

        return cell
    }
    
    // 各セルを選択した時に実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        // セルが選択された時(選択されているセルが変更された時)も２つ目の画面にデータ渡す
        let v2 = self.navigationController!.tabBarController!.viewControllers![1] as! HomeViewController
        self.indexPath = indexPath
        v2.postData = postArray[indexPath.row]
    }
}
