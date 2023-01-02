import UIKit
import Kingfisher
class SecondCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet var dateLabel1: UILabel!
    @IBOutlet var rightImage: UIImageView!
    static let identifire = "SecondCollectionViewCell"
    
    @IBOutlet var secondPointLabel: UILabel!
    @IBOutlet var firstPointLabel: UILabel!
    @IBOutlet var srcondComandLabel: UILabel!
    @IBOutlet var firstComandLabel: UILabel!
    @IBOutlet var leftImage: UIImageView!
    
    static func nib()-> UINib{
        return UINib(nibName: "SecondCollectionViewCell", bundle: nil)
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    // MARK: - Public Methods
    
    public func setupView(model: Response){
        self.dateLabel1.text = changeDateFormat(dateString: (model.fixture?.date)!, fromFormat: "yyyy-MM-dd'T'HH:mm:ssZ", toFormat: "dd.MM HH:mm")
        self.firstComandLabel.text = model.teams?.home?.name ?? ""
        self.srcondComandLabel.text = model.teams?.away?.name ?? ""
        self.leftImage.kf.setImage(with: URL(string: model.teams?.home?.logo ?? ""))
        self.rightImage.kf.setImage(with: URL(string: model.teams?.away?.logo ?? ""))
        self.secondPointLabel.text = "0"
        self.firstPointLabel.text = "0"
    }
    
    
    
    
}
