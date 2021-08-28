import UIKit
import Firebase

class PostData: NSObject {
    var id: String
    var catName: String?
    var birthday: String?
    var catBreed: String?
    var imageNo: Int!

    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID

        let postDic = document.data()
        
        self.catName = postDic["catName"] as? String

        self.birthday = postDic["birthday"] as? String
        
        self.catBreed = postDic["catBreed"] as? String
        
        self.imageNo = postDic["imageNo"] as? Int
        }
}
