import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var vExperimental: UIView!
    @IBOutlet weak var lcBottom: NSLayoutConstraint!
    @IBOutlet weak var lcLeft: NSLayoutConstraint!
    @IBOutlet weak var lcTop: NSLayoutConstraint!
    @IBOutlet weak var lcRight: NSLayoutConstraint!
    
    
    @IBAction func btnResizeClicked(sender: UIButton) {
        
        let maxWidth = self.view.bounds.size.width - self.lcLeft.constant - self.lcRight.constant
        let width = Float(arc4random_uniform(UInt32(maxWidth)))
        
        let maxHeight = self.view.bounds.size.height - self.lcBottom.constant - self.lcTop.constant
        let height = Float(arc4random_uniform(UInt32(maxHeight)))
        
        println("mW = \(maxWidth), mH = \(maxHeight), w = \(width), h = \(height)")
        self.vExperimental.frame.size = CGSizeMake(CGFloat(width), CGFloat(height))
    }
}
