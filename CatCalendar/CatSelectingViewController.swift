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
    var postArray: [PostData]

    // Firestoreのリスナー
    var listener: ListenerRegistration?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //一番上のセルが最初から選択されている処理
        self.tableView.selectRow(at: [0,0], animated: false, scrollPosition: .top)
        let v2 = self.tabBarController!.viewControllers![1] as! HomeViewController
        v2.selectRowNo = self.tableView.cellForRow(at: [0,0])!.postData.catName!
        v2.postData = postData
        self.present(v2, animated: true, completion: nil)

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
        cell.textLabel!.text = "ねこちゃん" + (indexPath.row+1).description

        return cell
    }
    
    // 各セルを選択した時に実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, forEvent event: UIEvent) {
        performSegue(withIdentifier: "cellSegue",sender: nil)
        
        // タップされたセルのインデックスを求める
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        
        // 配列からタップされたインデックスのデータを取り出す
        let postData = postArray[indexPath!.row]
        // セルが選択された時(選択されているセルが変更された時)も２つ目の画面にデータ渡す
        let v2 = self.tabBarController!.viewControllers![1] as! HomeViewController
        v2.postData = postData
        v2.selectRowNo = self.tableView.cellForRow(at: indexPath!)!.textLabel!.text!
        self.present(v2, animated: true, completion: nil)
    }
}
