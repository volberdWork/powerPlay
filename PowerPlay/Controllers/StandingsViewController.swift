import UIKit
import Alamofire
class StandingsViewController: UIViewController{
    
    
    @IBOutlet var tableView: UITableView!
    var array : [[Standings]] = [[]]
    var leagueId = 0
    var season = 0
    var dataStatus = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        standingsBase(league: leagueId, season: season)
        
        
    }
    
    func showAlertAction(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func configure(){
        view.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        tableView.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        tableView.register(StandingsTableViewCell.nib(), forCellReuseIdentifier: StandingsTableViewCell.identifier )
        self.title = "Standings"
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    
    
    
    func standingsBase(league: Int, season: Int){
        let url = "https://v3.football.api-sports.io/standings?league=\(league)&season=\(season)"
        let headers: HTTPHeaders = ["x-apisports-key":"9a49740c5034d7ee252d1e1419a10faa"]
        AF.request(url, headers: headers).responseJSON { responseJSON in
            let decoder = JSONDecoder()
            guard let respponseData = responseJSON.data else {return}
            do {
                let data = try decoder.decode(StandBase.self, from: respponseData)
                if let unwrapped = data.response{
                    if unwrapped.count > 0{
                        self.array = unwrapped[0].league?.standings ?? [[]]
                    }else{
                        self.showAlertAction(title: "Sorry", message: "No data")
                    }
                }
                self.tableView.reloadData()
                print("Finish")
            } catch {
               
                
                //                self.dataStatus = false
            }
            
        }
    }
    
    
   
        
    
    
}

extension StandingsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            return array[0].count
        
        
    }
    
   

       
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StandingsTableViewCell") as? StandingsTableViewCell else { return UITableViewCell() }
        let data = array[0]
        cell.selectionStyle = .none
        cell.nameLabel.text = data[indexPath.row].team?.name ?? ""
        cell.logoLink = data[indexPath.row].team?.logo ?? ""
        cell.rankLabel.text = "\(data[indexPath.row].rank ?? 0)"
        cell.ageinstLAbel.text = "A \(data[indexPath.row].all?.goals?.against ?? 0)"
        cell.drawLabel.text = "D \(data[indexPath.row].all?.draw ?? 0)"
        cell.forLabel.text = "F \(data[indexPath.row].all?.goals?.forTeam ?? 0)"
        cell.loseLabel.text = "L \(data[indexPath.row].all?.lose ?? 0)"
        cell.goalsDiffLAbel.text = "GD \(data[indexPath.row].goalsDiff ?? 0)"
        cell.playersLabel.text = "PL \(data[indexPath.row].all?.played ?? 0)"
        cell.winLabel.text = "W \(data[indexPath.row].all?.win ?? 0)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    
}
