//
//  HomeViewController.swift
//  CatCalendar
//
//  Created by Sakiko Watanabe on 2021/08/17.
//

import UIKit
import FSCalendar
import CalculateCalendarLogic

class HomeViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance {
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var label: UILabel!
    
    var postData: PostData!
    var infoData: InfoData!
    var getDate: String?
    var selectRowNo: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendar.dataSource = self
        self.calendar.delegate = self
        
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
    
    //カレンダー日にちを取得
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
        let formattar = DateFormatter()
         formattar.dateFormat = "MM-dd-YYYY"
      self.getDate = formattar.string(from: date)
        
        
        
        //詳細入力画面への画面遷移
        let informationViewController = self.storyboard?.instantiateViewController(withIdentifier: "InformationViewController") as! InformationViewController
        //InformationViewControllerへpostDataの受け渡し
        informationViewController.postData = self.postData
        //InformationViewControllerへgetDataの受け渡し
        informationViewController.getDate = self.getDate
        
        self.present(informationViewController, animated: true, completion: nil)
        
    }
    //
}
