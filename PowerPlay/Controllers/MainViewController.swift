import UIKit
import Alamofire
import Kingfisher
import AudioToolbox
class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet var firstCollectionView: UICollectionView!
    
    @IBOutlet var secondCollectionView: UICollectionView!
    var fixtersArray: [Response] = []
    var liveArray: [Response] = []
    let headers: HTTPHeaders = ["x-apisports-key":"9a49740c5034d7ee252d1e1419a10faa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        loadLiveBase()
        loadFixtersBase()
       
    }
    
    
    
    func setupNavigationBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
         
        
    }
    
    
    
    func configure(){
        view.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == firstCollectionView){
            return liveArray.count
        }
        return fixtersArray.count
        
    }
    
    func loadLiveBase(){
        let url = "https://v3.football.api-sports.io/fixtures?live=all"
        
        AF.request(url, headers: headers).responseJSON { responseJSON in
            let decoder = JSONDecoder()
            guard let respponseData = responseJSON.data else {return}
            
            do {
                let data = try decoder.decode(LiveBase.self, from: respponseData)
                print(data.response?.count ?? 0)
                
                self.liveArray = data.response!
                self.firstCollectionView.reloadData()
                
            } catch {
                print("Щось пішло не так")
            }
        }
    }
    
    func loadFixtersBase(){
        let urlFixtures = "https://v3.football.api-sports.io/fixtures?next=50"
        
        AF.request(urlFixtures, headers: headers).responseJSON { responseJSON in
            let decoder = JSONDecoder()
            guard let respponseData = responseJSON.data else {return}
            
            do {
                let data = try decoder.decode(FixtersBase.self, from: respponseData)
                print(data.response ?? 0)
                self.fixtersArray = data.response!
                self.secondCollectionView.reloadData()
                
            } catch {
                print("Щось пішло не так")
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
        case secondCollectionView:
            let cell2 = secondCollectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as! SecondCollectionViewCell
            
            cell2.setupView(model: fixtersArray[indexPath.row])
            collectionView.backgroundColor = self.view.backgroundColor
            
            return cell2
        case firstCollectionView:
            let cell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: "MainFirstInfoCollectionViewCell", for: indexPath) as! MainFirstInfoCollectionViewCell
            
            cell.firstSetupView(model: liveArray[indexPath.row])
            collectionView.backgroundColor = self.view.backgroundColor
            return cell
            
        default:
            return UICollectionViewCell()
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        switch collectionView {
            
        case secondCollectionView:
            let main = UIStoryboard(name: "Main", bundle: nil)
            if let vc = main.instantiateViewController(withIdentifier: "DetailCellViewController") as? DetailCellViewController {
                navigationController?.pushViewController(vc, animated: true)
                vc.yearText = String(describing: self.fixtersArray[indexPath.row].league?.season ?? 0)
                vc.awayTeamName = self.fixtersArray[indexPath.row].teams?.away?.name ?? ""
                vc.homeTeamName = self.fixtersArray[indexPath.row].teams?.home?.name ?? ""
                vc.awayPoint = self.fixtersArray[indexPath.row].goals?.away ?? 0
                vc.homePoint = self.fixtersArray[indexPath.row].goals?.home ?? 0
                vc.seasonText = "Season \(String(describing: self.fixtersArray[indexPath.row].league?.season ?? 0))"
                vc.leagueText = self.fixtersArray[indexPath.row].league?.name ?? ""
                vc.dataText = changeDateFormat(dateString: (self.fixtersArray[indexPath.row].fixture?.date)!, fromFormat: "yyyy-MM-dd'T'HH:mm:ssZ", toFormat: "dd MMMM HH:mm")
                vc.awaylogoLink = self.fixtersArray[indexPath.row].teams?.away?.logo ?? ""
                vc.homeLogoLink = self.fixtersArray[indexPath.row].teams?.home?.logo ?? ""
                vc.awayId = self.fixtersArray[indexPath.row].teams?.away?.id ?? 0
                vc.homeId = self.fixtersArray[indexPath.row].teams?.home?.id ?? 0
                vc.season = self.fixtersArray[indexPath.row].league?.season ?? 0
                vc.league = self.fixtersArray[indexPath.row].league?.id ?? 0
                vc.fixtersId = self.fixtersArray[indexPath.row].fixture?.id ?? 0
            }
            if SetingsViewController().userSettingsVibration.bool(forKey: "onOffKey"){
                UIDevice.vibrate()
                print("vibrate on")
            } else{
                return
            }
            
        case firstCollectionView :
            let main = UIStoryboard(name: "Main", bundle: nil)
            if let vc = main.instantiateViewController(withIdentifier: "DetailCellViewController") as? DetailCellViewController {
                navigationController?.pushViewController(vc, animated: true)
                vc.yearText = String(describing: self.liveArray[indexPath.row].league?.season ?? 0)
                vc.awayTeamName = self.liveArray[indexPath.row].teams?.away?.name ?? ""
                vc.homeTeamName = self.liveArray[indexPath.row].teams?.home?.name ?? ""
                vc.awayPoint = self.liveArray[indexPath.row].goals?.away ?? 0
                vc.homePoint = self.liveArray[indexPath.row].goals?.home ?? 0
                vc.seasonText = "Season \(String(describing: self.liveArray[indexPath.row].league?.season ?? 0))"
                vc.leagueText = self.liveArray[indexPath.row].league?.name ?? ""
                vc.dataText = changeDateFormat(dateString: (self.liveArray[indexPath.row].fixture?.date)!, fromFormat: "yyyy-MM-dd'T'HH:mm:ssZ", toFormat: "dd MMMM HH:mm")
                vc.awaylogoLink = self.liveArray[indexPath.row].teams?.away?.logo ?? ""
                vc.homeLogoLink = self.liveArray[indexPath.row].teams?.home?.logo ?? ""
                vc.awayId = self.liveArray[indexPath.row].teams?.away?.id ?? 0
                vc.homeId = self.liveArray[indexPath.row].teams?.home?.id ?? 0
                vc.season = self.liveArray[indexPath.row].league?.season ?? 0
                vc.league = self.liveArray[indexPath.row].league?.id ?? 0
                vc.fixtersId = self.liveArray[indexPath.row].fixture?.id ?? 0
            }
            
            if SetingsViewController().userSettingsVibration.bool(forKey: "onOffKey"){
                UIDevice.vibrate()
                print("vibrate on")
            } else{
                return
            }
            
            
        default:
            return
        }
    }
    
    
    @IBAction func setingButtonPressed(_ sender: UIButton) {
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "SetingsViewController") as? SetingsViewController {
            
            navigationController?.pushViewController(vc, animated: true)
        }
        if SetingsViewController().userSettingsVibration.bool(forKey: "onOffKey"){
            UIDevice.vibrate()
            print("vibrate on")
        } else{
            return
        }
        
    }
    
}


extension MainViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 185, height: 235)
    }
}
