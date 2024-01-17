import UIKit

class CustomCircle: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupGestureRecognizers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupGestureRecognizers()
    }
    
    private func setupView() {
        backgroundColor = .purple
        translatesAutoresizingMaskIntoConstraints = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        frame.size = CGSize(width: bounds.width, height: bounds.height)
        layer.cornerRadius = CGFloat(bounds.width / 2)
    }
    
    private func setupGestureRecognizers() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan))
        addGestureRecognizer(panGestureRecognizer)
    }
    
    
    @objc private func didPan(_ sender: UIPanGestureRecognizer) {
        UIView.animate(withDuration: 0.05) {
            self.center = sender.location(in: self.superview)
        }
    }
    
    @objc private func didTap(_ sender: UIPanGestureRecognizer) {
        UIView.animate(withDuration: 0.314) {
            self.backgroundColor = UIColor.random()
        }
    }
    
}
