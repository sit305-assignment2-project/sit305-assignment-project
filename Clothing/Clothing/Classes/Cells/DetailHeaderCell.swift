//
//  DetailHeaderCell.swift
//  Clothing
//
//

import UIKit

class DetailHeaderCell: UITableViewCell {

    lazy var cycleScrollView : LLCycleScrollView = {
        let cycleScrollView = LLCycleScrollView.llCycleScrollViewWithFrame(CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: 220.0));
        //        // 是否无限循环，此属性修改了就不存在轮播的意义了 😄
        //        cycleScrollView.infiniteLoop = true
        //        // 是否自动滚动
        //        cycleScrollView.autoScroll = true
        
        // 滚动间隔时间(默认为2秒)
        cycleScrollView.autoScrollTimeInterval = 3.0
        // 等待数据状态显示的占位图
        cycleScrollView.placeHolderImage = UIImage(named: "")
        // 如果没有数据的时候，使用的封面图
        cycleScrollView.coverImage = UIImage(named: "")
        // 设置图片显示方式=UIImageView的ContentMode
        cycleScrollView.imageViewContentMode = .scaleToFill
        // 设置滚动方向（ vertical || horizontal ）
        cycleScrollView.scrollDirection = .horizontal
        // 设置当前PageControl的样式 (.none, .system, .fill, .pill, .snake)
        cycleScrollView.customPageControlStyle = .snake
        // 非.system的状态下，设置PageControl的tintColor
        cycleScrollView.customPageControlInActiveTintColor = UIColor.STColorWithHex(rgbValue: 0xE5E5E5)
        // 设置.system系统的UIPageControl当前显示的颜色
        cycleScrollView.pageControlCurrentPageColor = UIColor.white
        // 非.system的状态下，设置PageControl的间距(默认为8.0)
        cycleScrollView.customPageControlIndicatorPadding = 4.0
        // 设置PageControl的位置 (.left, .right 默认为.center)
        cycleScrollView.pageControlPosition = .center
        // 背景色
        cycleScrollView.collectionViewBackgroundColor = UIColor.STColorWithHex(rgbValue: 0x34C00E)
        
        cycleScrollView.isAddingPercentEncodingForURLString = true
        
        cycleScrollView.delegate = self
        
        
        return cycleScrollView;
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func cellModel(_ images:Array<String>) {
        //在这里来设置状态
        if images.count > 0 {
            
            self.cycleScrollView.imagePaths = images
            // 是否无限循环，此属性修改了就不存在轮播的意义了 😄
            self.cycleScrollView.infiniteLoop = true
            // 是否自动滚动
            self.cycleScrollView.autoScroll = true
            
            self.addSubview(self.cycleScrollView)
        }
        
        
    }
    
}

extension DetailHeaderCell: LLCycleScrollViewDelegate {
    
    func cycleScrollView(_ cycleScrollView: LLCycleScrollView, didSelectItemIndex index: NSInteger) {
//        STSBLog.debug(index)
//        let model = self.dataModelArray[index]
//        if let foreignLink = model.foreignLink {
//            if clickLinkBlock != nil && !foreignLink.isEmpty {
//
//                self.clickLinkBlock!(foreignLink)
//            }
//        }
    }
}

extension UIColor {
    
    /// rgb颜色
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255.0 ,green: g/255.0 ,blue: b/255.0 ,alpha:1.0)
    }
    /// 纯色（用于灰色）
    convenience init(gray: CGFloat) {
        self.init(red: gray/255.0 ,green: gray/255.0 ,blue: gray/255.0 ,alpha:1.0)
    }
    // 获取一个随机颜色
    class func STRandomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
    // 通过十六进制数设置颜色
    class func STColorWithHex(rgbValue: Int) -> UIColor {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
                       alpha: 1.0)
    }
    class func STColorWithHex(rgbValue: Int,alpha:CGFloat) -> UIColor {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
                       alpha: alpha)
    }
    
    class func imageFromColor(color: UIColor, viewSize: CGSize) -> UIImage{
        
        let rect: CGRect = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)
        
        UIGraphicsBeginImageContext(rect.size)
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        
        context.setFillColor(color.cgColor)
        
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsGetCurrentContext()
        
        return image!
        
    }
    
    /// 通过RGB设置颜色
    ///
    /// - Returns: 颜色
    func STColorRGB() -> (CGFloat,CGFloat,CGFloat) {
        var red     :CGFloat = 0
        var green   :CGFloat = 0
        var blue    :CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: nil)
        return (red * 255,green * 255,blue * 255)
        
    }
    
}
