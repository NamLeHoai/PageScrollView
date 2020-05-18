//
//  ViewController.swift
//  PageScrollView1
//
//  Created by Nam Le on 5/18/20.
//  Copyright © 2020 Nam Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer: Timer!
    var pages: [View] {
        get {
            let page1: View = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
            page1.view.backgroundColor = .red
            page1.label.text = "red"
            
            let page2: View = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
            page2.view.backgroundColor = .blue
            page2.label.text = "blue"
            
            let page3: View = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
            page3.view.backgroundColor = .yellow
            page3.label.text = "yellow"
            
            let page4: View = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
            page4.view.backgroundColor = .systemPink
            page4.label.text = "systemPink"
            
            let page5: View = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! View
            page5.view.backgroundColor = .purple
            page5.label.text = "purple"
            
            return [page1, page2, page3, page4, page5]
        }
    }

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bringSubviewToFront(pageControl)
        setupScrollView(pages: pages)
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeView), userInfo: nil, repeats: true)
    }
    
    @objc func changeView() {
        if pageControl.currentPage == pageControl.numberOfPages - 1{
            pageControl.currentPage = 0
            scrollView.contentOffset.x = 0
        } else {
            scrollView.contentOffset.x += view.frame.width
            pageControl.currentPage += 1
        }
        
        
    }

    func setupScrollView(pages: [View]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(pages.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0..<pages.count {
            pages[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(pages[i])
        }
    }
}
//
//extension ViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
//        pageControl.currentPage = Int(pageIndex)
//    }
//}

