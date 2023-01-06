import UIKit
import AudioToolbox
class SetingsViewController: UIViewController {
    
    @IBOutlet var vibrationLabel: UILabel!
    
    @IBOutlet var onOffSwitch: UISwitch!
    var userSettingsVibration = UserDefaults.standard
    let onOffKey = "onOffKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        checkVibrationState()
        
    }
    
    func checkVibrationState(){
        if (userSettingsVibration.bool(forKey: onOffKey)){
            onOffSwitch.setOn(true, animated: false)
            vibrationLabel.text = "Vibration ON"
        } else{
            onOffSwitch.setOn(false, animated: false)
            vibrationLabel.text = "Vibration OFF"
        }
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        if (onOffSwitch.isOn){
            userSettingsVibration.set(true, forKey: onOffKey)
            vibrationLabel.text = "Vibration ON"
        }else{
            userSettingsVibration.set(false , forKey: onOffKey)
            vibrationLabel.text = "Vibration OFF"
        }
       
    }
    
    
    
    
    
    @IBAction func savedPressed(_ sender: UIButton) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "SavedViewController") as? SavedViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
        if SetingsViewController().userSettingsVibration.bool(forKey: "onOffKey"){
            UIDevice.vibrate()
            print("vibrate on")
        } else{
            return
        }
    }
    @IBAction func pressedButtonNotification(_ sender: UIButton) {
        performNotificationSettings()
        if SetingsViewController().userSettingsVibration.bool(forKey: "onOffKey"){
            UIDevice.vibrate()
            print("vibrate on")
        } else{
            return
        }
    }
    

    
    
    func performNotificationSettings() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        
        if let appSettings = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(appSettings) {
            UIApplication.shared.open(appSettings)
        }
        
    }
    
}

