import UIKit
import Alamofire

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
   
    @IBOutlet var collectionView: UICollectionView!
    
    
    
    var array: [ResponseResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        NotificationCenter.default.addObserver(self, selector: #selector(showDetailController(notification:)), name: Notification.Name("cellTap"), object: nil)
        loadDataFromAPI()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    
    @objc private func showDetailController(notification: Notification) {
        
        print("ID:", notification)
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let vc = main.instantiateViewController(withIdentifier: "DetailCellViewController")
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func configure(){
        view.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        
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
                    self.collectionView.reloadData()
                } catch {
                    print("Щось пішло не так")
                }
                
            }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainInfoCollectionViewCell", for: indexPath) as! MainInfoCollectionViewCell
        
        cell.setupView(model: array[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    
    
    }
 



extension MainViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: 185, height: 235)
    }
}
