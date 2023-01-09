import UIKit
import AudioToolbox
class SetingsViewController: UIViewController {
    
    @IBOutlet var vibrationLabel: UILabel!
    @IBOutlet var vibrationsView: UIView!
    @IBOutlet var onOffSwitch: UISwitch!
    let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    let yourBackImage = UIImage(named: "backButton")
    
    
    
    var userSettingsVibration = UserDefaults.standard
    let onOffKey = "onOffKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkVibrationState()
        setupNavigationBarItems()
        
    }
    
    
    private func setupNavigationBarItems(){
        let view = UIView()
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.addTarget(self, action: #selector(popnav), for: .touchUpInside)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
        button.sizeToFit()
        view.addSubview(button)
        view.frame = button.bounds
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: view)
        
        
    }
    
    @objc func popnav() {
        self.navigationController?.popViewController(animated: true)
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
    
    @IBAction func termOfServiceButtonPressed(_ sender: UIButton) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "TermsOfServiceViewController") as? TermsOfServiceViewController {
            present(vc, animated: true)
        }
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


