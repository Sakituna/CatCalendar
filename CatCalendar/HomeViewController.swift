//
//  HomeViewController.swift
//  CatCalendar
//
//  Created by Sakiko Watanabe on 2021/08/17.
//

import UIKit
import FSCalendar
import Firebase
import CalculateCalendarLogic

class HomeViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance {
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var label: UILabel!
    
    var postData: PostData!
    var infoData:InfoData!
    var getDate: String?
    var selectRowNo: String = ""
    var datesWithEvent = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendar.dataSource = self
        self.calendar.delegate = self
        
        //横スクロールで月を変更
        calendar.scrollDirection = .horizontal
        //選択中・今日の日付を四角で表示する
        calendar.appearance.borderRadius = 0
        
        //カレンダー上部サイドの年・月を消す
        self.calendar.appearance.headerMinimumDissolvedAlpha = 0.0;
        
        // calendarの曜日部分を日本語表記に変更
        calendar.calendarWeekdayView.weekdayLabels[0].text = "日"
        calendar.calendarWeekdayView.weekdayLabels[1].text = "月"
        calendar.calendarWeekdayView.weekdayLabels[2].text = "火"
        calendar.calendarWeekdayView.weekdayLabels[3].text = "水"
        calendar.calendarWeekdayView.weekdayLabels[4].text = "木"
        calendar.calendarWeekdayView.weekdayLabels[5].text = "金"
        calendar.calendarWeekdayView.weekdayLabels[6].text = "土"
        // calendarの曜日部分の色を変更
        calendar.calendarWeekdayView.weekdayLabels[0].textColor = .systemRed
        calendar.calendarWeekdayView.weekdayLabels[6].textColor = .systemBlue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.label.text = selectRowNo
    }
    
    // FSCalendarDataSource
    func calendar(calendar: FSCalendar!, hasEventForDate date: NSDate!) -> Bool {
        return shouldShowEventDot
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
        let formattar = DateFormatter()
        formattar.dateFormat = "YYYY-MM-dd"
        let selectDate = formattar.string(from: date)
        self.getDate = selectDate
            
        let infoRef = Firestore.firestore().collection(Const.PostPath).document(postData.id).collection(Const.InfoPath).document(selectDate)
        infoRef.getDocument() { document, error in
            if let error = error {
                print("DEBUG_PRINT: documentの取得が失敗しました。 \(error)")
                return
            }

            var infoData: InfoData?
            if let document = document, document.exists {
                // 該当日付のdocumentが保存されている場合は、InfoDataを生成する
                infoData = InfoData(document: document)
            }
                
            //詳細入力画面への画面遷移
            let informationViewController = self.storyboard?.instantiateViewController(withIdentifier: "InformationViewController") as! InformationViewController
            //InformationViewControllerへpostDataの受け渡し
            informationViewController.postData = self.postData
            //InformationViewControllerへgetDataの受け渡し
            informationViewController.getDate = self.getDate
            //InformationViewControllerへinfoDataの受け渡し
            informationViewController.infoData = infoData

            self.present(informationViewController, animated: true, completion: nil)
        }
    }
}

