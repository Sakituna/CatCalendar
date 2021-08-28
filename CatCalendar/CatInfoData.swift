import UIKit
import Firebase

class InfoData: NSObject {
    var id: String
    var caption: String?
    var date: Date?
    var conditionImageNo: Int!
    var appetiteImageNo: Int!
    var foodImageNo: Int!
    var peeImageNo: Int!
    var pooImageNo: Int!
    
    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID
        let infoDic = document.data()
        
        self.caption = infoDic["caption"] as? String
        
        self.conditionImageNo = infoDic["conditionImageNo"] as? Int
        
        self.appetiteImageNo = infoDic["appetiteImageNo"] as? Int
 
        self.foodImageNo = infoDic["foodImageNo"] as? Int
        
        self.peeImageNo = infoDic["peeImageNo"] as? Int
        
        self.pooImageNo = infoDic["pooImageNo"] as? Int
    }
}
