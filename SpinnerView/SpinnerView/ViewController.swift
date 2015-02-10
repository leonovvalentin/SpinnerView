import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var vExperimental: UIView!
    @IBOutlet weak var lcWidth: NSLayoutConstraint!
    @IBOutlet weak var lcHeight: NSLayoutConstraint!
    
    
    @IBAction func btnResizeClicked(sender: UIButton) {
        
        let maxWidth = self.view.bounds.size.width
        let width = arc4random_uniform(UInt32(maxWidth))
        self.lcWidth.constant = CGFloat(width)
        
        let maxHeight = self.view.bounds.size.height
        let height = arc4random_uniform(UInt32(maxHeight))
        self.lcHeight.constant = CGFloat(height)
        
        self.view.setNeedsLayout()
    }
    
    @IBAction func btnStartSpinnerClicked(sender: UIButton) {
        self.vExperimental.startSpinner()
    }
}
