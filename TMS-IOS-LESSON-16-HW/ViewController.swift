import UIKit

class ViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    let circleSize = 170
    
    var circle: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circle = CustomCircle(frame: CGRect(x: 0, y: 0, width: circleSize, height: circleSize))
        
        view.addSubview(circle)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        tapGestureRecognizer.numberOfTapsRequired = 1
        circle.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func didTap() {
        UIView.animate(withDuration: 0.3, animations: {
            self.circle.alpha = 0
        }) { done in
            if done {
                self.circle.frame = CGRect(x:Int.random(in: 0..<Int(self.screenSize.width - CGFloat(self.circleSize))) , y: Int.random(in: 0..<Int(self.screenSize.height - CGFloat(self.circleSize))) , width: self.circleSize, height: self.circleSize)
                UIView.animate(withDuration: 0.3) {
                    self.circle.alpha = 1
                    self.circle.backgroundColor = UIColor.random()
                }
            }
        }
     
    }
}


