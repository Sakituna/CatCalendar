import UIKit
import Firebase

class PostData: NSObject {
    var id: String
    var catName: String?
    var birthday: String?
    var catBreed: String?
    var likes: [String] = []
    var isLiked: Bool = false

    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID

        let postDic = document.data()

        self.catName = postDic["catName"] as? String

        self.birthday = postDic["birthday"] as? String
        
        self.catBreed = postDic["catBreed"] as? String

        if let likes = postDic["likes"] as? [String] {
            self.likes = likes
        }
        if let myid = Auth.auth().currentUser?.uid {
            // likesの配列の中にmyidが含まれているかチェックすることで、自分がいいねを押しているかを判断
            if self.likes.firstIndex(of: myid) != nil {
                // myidがあれば、いいねを押していると認識する。
                self.isLiked = true
            }
        }
    }
}
