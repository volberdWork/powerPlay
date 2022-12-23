import UIKit

class DetailCellViewController: UIViewController {
    
    @IBOutlet var darkRectangle: UIView!
    
    @IBOutlet var buttons: [UIButton]!
    
    
    @IBOutlet var yearView: UIView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    
    
    func configure(){
        darkRectangle.layer.cornerRadius = 50
        yearView.layer.cornerRadius = 20
        for button in buttons{
            button.layer.cornerRadius = 12
        }
        darkRectangle.layer.masksToBounds = true
        darkRectangle.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
}

