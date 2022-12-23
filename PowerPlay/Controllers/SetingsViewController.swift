import UIKit

class SetingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    
    
    @IBAction func pressedButtonNotification(_ sender: UIButton) {
        performNotificationSettings()
    }
    
    @IBAction func pressedButtonVibration(_ sender: UIButton) {
    }
    
    
    func performNotificationSettings() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        if let appSettings = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(appSettings) {
            UIApplication.shared.open(appSettings)
        }
    }
    
}
