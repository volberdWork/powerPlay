import UIKit
import Alamofire
import Kingfisher

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet var firstCollectionView: UICollectionView!
    
    @IBOutlet var secondCollectionView: UICollectionView!
    var array: [ResponseResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        loadDataFromAPI()
      
       
    }
    
    
    
    
    
    func loadDataFromAPI(){
        
        let url = "https://v3.football.api-sports.io/fixtures?next=50"
        let headers: HTTPHeaders = ["x-apisports-key":"9a49740c5034d7ee252d1e1419a10faa"]
        
        AF.request(url, method: .get, headers: headers).responseJSON { responseJSON in
            let decoder = JSONDecoder()
            guard let respponseData = responseJSON.data else {return}
            
            do {
                let data = try decoder.decode(InfoTrend.self, from: respponseData)
                self.array = data.response
                self.firstCollectionView.reloadData()
                self.secondCollectionView.reloadData()
            } catch {
                print("Щось пішло не так")
            }
            
        }
    }
    
    
    
    
    
    func configure(){
        view.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        
    }
    
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == firstCollectionView){
            return array.count
        }
        return array.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == firstCollectionView){
            let cell = firstCollectionView.dequeueReusableCell(withReuseIdentifier: "MainFirstInfoCollectionViewCell", for: indexPath) as! MainFirstInfoCollectionViewCell
            
           cell.firstSetupView(model: array[indexPath.row])
            collectionView.backgroundColor = self.view.backgroundColor
            return cell
        }
       
        let cell2 = secondCollectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as! SecondCollectionViewCell
        
        cell2.setupView(model: array[indexPath.row])
        collectionView.backgroundColor = self.view.backgroundColor
       
        return cell2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = array[indexPath.row]
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "DetailCellViewController") as? DetailCellViewController {
            navigationController?.pushViewController(vc, animated: true)
            vc.yearText = String(describing: data.league?.season ?? 0)
            vc.awayTeamName = data.teams?.away?.name ?? ""
            vc.homeTeamName = data.teams?.home?.name ?? ""
            vc.awayPoint = data.goals?.away ?? 0
            vc.homePoint = data.goals?.home ?? 0
            vc.seasonText = "Season \(String(describing: data.league?.season ?? 0))"
            vc.leagueText = data.league?.name ?? ""
            vc.dataText = changeDateFormat(dateString: (data.fixture?.date)!, fromFormat: "yyyy-MM-dd'T'HH:mm:ssZ", toFormat: "dd MMMM HH:mm")
            vc.awaylogoLink = data.teams?.away?.logo ?? ""
            vc.homeLogoLink = data.teams?.home?.logo ?? ""

        }


    }
}




extension MainViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 185, height: 235)
    }
}
