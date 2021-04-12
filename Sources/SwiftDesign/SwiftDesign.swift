import UIKit

extension UIView {
    
    public func roundCorners(radius: CGFloat, masksToBounds: Bool = false) {
        
        self.layer.masksToBounds = masksToBounds
        self.layer.cornerRadius = radius
        
    }
    
    public func addShadow(radius: CGFloat = 4.0, opacity: Float = 0.2, offset: CGSize = CGSize(width: 3, height: 3), color: UIColor = .black) {
        
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        
    }
    
    public func addGradient(colors: [UIColor] = [.blue, .white], locations: [NSNumber] = [0, 2], startPoint: CGPoint = CGPoint(x: 0.0, y: 1.0), endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0), type: CAGradientLayerType = .axial){
            
            let gradient = CAGradientLayer()
            
            gradient.frame.size = self.frame.size
            gradient.frame.origin = CGPoint(x: 0.0, y: 0.0)

            // Iterates through the colors array and casts the individual elements to cgColor
            // Alternatively, one could use a CGColor Array in the first place or do this cast in a for-loop
            gradient.colors = colors.map{ $0.cgColor }
            
            gradient.locations = locations
            gradient.startPoint = startPoint
            gradient.endPoint = endPoint
            
            // Insert the new layer at the bottom-most position
            // This way we won't cover any other elements
            self.layer.insertSublayer(gradient, at: 0)
        }
    
}
