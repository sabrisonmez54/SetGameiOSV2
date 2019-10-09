//
//  ScrollViewController.swift
//  SetGame
//
//  Created by Sabri Sönmez on 9/24/19.
//  Copyright © 2019 Sabri Sönmez. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    
    //data for the slides
    var titles = ["What is a SET?","How to play","Fun and Educational"]
    var descs = ["A SET is three cards where each feature, when looked at individually, is either all the same OR all different. Each card contains four features: color (red, purple or green), shape (oval, squiggle or diamond), number (one, two or three) and shading (solid, striped or outlined).","SET is a speed game. The first to see a SET, calls out SET and picks up the three cards that make the SET. There are no turns and no luck. Race to find as many SETs as fast as you can. Be the one who has the most SETs when the cards are gone, and you win! SET is a game of fast-thinking fun!","SET builds cognitive, logical and spatial reasoning skills as well as visual perception skills while playing a game! Because it has a rule of logic (three cards that are all the same or all different in each individual feature), and because players must apply this rule to the spatial array of patterns all at once, they must use both left brain and right brain thought processes. This fun game actually exercises your brain!"]
    var imgs = ["setPic","setPic2","setPic3"]
    
    //get dynamic width and height of scrollview and save it
    override func viewDidLayoutSubviews() {
        scrollWidth = scrollView.frame.size.width
        scrollHeight = scrollView.frame.size.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        //to call viewDidLayoutSubviews() and get dynamic width and height of scrollview
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        //crete the slides and add them
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        for index in 0..<titles.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)
            
            let slide = UIView(frame: frame)
            
            //subviews
            let imageView = UIImageView.init(image: UIImage.init(named: imgs[index]))
            imageView.frame = CGRect(x:0,y:0,width:300,height:300)
            imageView.contentMode = .scaleAspectFit
            imageView.center = CGPoint(x:scrollWidth/2,y: scrollHeight/2 - 50)
            
            
            let txt1 = UILabel.init(frame: CGRect(x:32,y:imageView.frame.maxY,width:scrollWidth-64,height:30))
            txt1.textAlignment = .center
            txt1.font = UIFont.boldSystemFont(ofSize: 20.0)
            txt1.text = titles[index]
            
            let txt2 = UILabel.init(frame: CGRect(x:32,y:txt1.frame.maxY+5,width:scrollWidth-64,height:200))
            txt2.textAlignment = .center
            txt2.numberOfLines = 0
        
            txt2.font = UIFont.systemFont(ofSize: 15.0)
            txt2.text = descs[index]
            
            slide.addSubview(imageView)
            slide.addSubview(txt1)
            slide.addSubview(txt2)
            scrollView.addSubview(slide)
            
            backButton.layer.cornerRadius = 10.0
            backButton.layer.shadowColor = UIColor.black.cgColor
            backButton.layer.shadowOpacity = 0.2
            backButton.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            backButton.layer.shadowRadius = 4.0
            
        }
        
        //set width of scrollview to accomodate all the slides
        scrollView.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeight)
        
        //disable vertical scroll/bounce
        self.scrollView.contentSize.height = 1.0
        
        //initial state
        pageControl.numberOfPages = titles.count
        pageControl.currentPage = 0
        
    }
    
    //indicator
    @IBAction func pageChanged(_ sender: Any) {
        scrollView!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((pageControl?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorForCurrentPage()
    }
    
    func setIndiactorForCurrentPage()  {
        let page = (scrollView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
        pageChanged(page)
    }
    
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


