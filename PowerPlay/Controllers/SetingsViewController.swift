import UIKit
import AudioToolbox
class SetingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    
    
    @IBAction func pressedButtonNotification(_ sender: UIButton) {
        performNotificationSettings()
    }
    
    @IBAction func pressedButtonVibration(_ sender: UIButton) {
        
    UIDevice.vibrate()
    }
    
    
    func performNotificationSettings() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        if let appSettings = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(appSettings) {
            UIApplication.shared.open(appSettings)
        }
    }
    
}
extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
