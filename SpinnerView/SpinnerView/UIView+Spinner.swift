import UIKit

let spinnerViewTag = 923478
let spinnerViewAlpha: CGFloat = 0.7
let spinnerViewStartDuration = 0.25
let spinnerViewStopDuration = 0.25

extension UIView {
    
    func startSpinner() {
        self.startSpinner(nil)
    }
    
    func startSpinner(completion: (Bool -> Void)?) {
        
        if self is UIActivityIndicatorView {
            return
        }
        
        let existingSpinnerView = self.viewWithTag(spinnerViewTag)
        let spinnerView = existingSpinnerView != nil ? existingSpinnerView! : UIView(frame: self.bounds)
        
        if existingSpinnerView == nil {
            
            spinnerView.tag = spinnerViewTag
            spinnerView.backgroundColor = UIColor.blackColor()
            spinnerView.alpha = 0
            spinnerView.hidden = true
            
            let spinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
            spinner.startAnimating()
            
            spinnerView.addSubview(spinner)
            
            spinner.setTranslatesAutoresizingMaskIntoConstraints(false)
            let views = ["s": spinner]
            spinnerView.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat("|-0-[s]-0-|",
                    options: NSLayoutFormatOptions(0),
                    metrics: nil,
                    views: views) +
                    NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[s]-0-|",
                        options: NSLayoutFormatOptions(0),
                        metrics: nil,
                        views: views)
            )
        }
        
        dispatch_async(dispatch_get_main_queue()) {
            
            self.addSubview(spinnerView)
            
            spinnerView.setTranslatesAutoresizingMaskIntoConstraints(false)
            let views = ["sv": spinnerView]
            self.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat("|-0-[sv]-0-|",
                    options: NSLayoutFormatOptions(0),
                    metrics: nil,
                    views: views) +
                    NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[sv]-0-|",
                        options: NSLayoutFormatOptions(0),
                        metrics: nil,
                        views: views)
            )
            
            spinnerView.hidden = false
            UIView.animateWithDuration(spinnerViewStartDuration,
                delay: 0,
                options: .BeginFromCurrentState,
                animations: {
                    spinnerView.alpha = spinnerViewAlpha
                },
                completion:completion
            )
        }
    }
    
    func stopSpinner() {
        self.stopSpinner(nil)
    }
    
    func stopSpinner(completion:(Bool -> Void)?) {
        
        if let spinnerView = self.viewWithTag(spinnerViewTag) {
            
            if spinnerView.hidden {
                return
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                UIView.animateWithDuration(spinnerViewStopDuration,
                    delay: 0,
                    options: .BeginFromCurrentState,
                    animations: {
                        spinnerView.alpha = 0
                    },
                    completion: {finished in
                        spinnerView.hidden = true
                        completion?(finished)
                    }
                )
            }
        }
    }
}
