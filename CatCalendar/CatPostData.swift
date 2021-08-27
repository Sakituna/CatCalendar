import UIKit
import Firebase

class PostData: NSObject {
    var id: String
    var catName: String?
    var birthday: String?
    var catBreed: String?
    var imageNo: Int!
    var good: [String] = []
    var isGood: Bool = false

    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID

        let postDic = document.data()
        
        if let catIds = postDic["catIds"] as? String {
            self.catName = catIds
        }

        self.birthday = postDic["birthday"] as? String
        
        self.catBreed = postDic["catBreed"] as? String
        
        self.imageNo = postDic["imageNo"] as? Int
        
        if let good = postDic["good"] as? [String] {
            self.good = good
        }
        if let myid = Auth.auth().currentUser?.uid {
            if self.good.firstIndex(of: myid) != nil {
                // myidがあれば、goodボタンを押していると認識する。
                self.isGood = true
            }
        }
    }
}
