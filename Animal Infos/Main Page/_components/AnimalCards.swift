import UIKit

class AnimalCards: UIView {
    
    
    @IBOutlet weak var animalTitle: UILabel!
    @IBOutlet weak var animalImage: UIImageView!
    
    var webUrl : String?
    var videoName : String?
    var title : String?{
        didSet {
          editUI()
        }
    }
    
    var imageName : String?{
        didSet{
            editUI()
        }
    }
    
    var goToWebPage: ((_ url:String) -> ())?
    var goToVideo: ((_ url:String) -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    
    
    private func setupView() {
        if let viewForXib = Bundle.main.loadNibNamed("AnimalCards", owner: self)?[0] as? UIView {
            viewForXib.frame = self.bounds
            viewForXib.layer.cornerRadius = 20
            addSubview(viewForXib)
        }
    }
    
    
    @IBAction func goToWebPage(_ sender: Any) {
        
        if let urlString = webUrl{
            goToWebPage?(urlString)
        }
    }
    
    
    @IBAction func pressedWatchVideo(_ sender: Any) {
        if let videoName = videoName{
            goToVideo?(videoName)
        }
    }
    
    func editUI(){
        if let title = title{
            animalTitle.text = title
            print(title)
        }
        if let imageName = imageName{
            animalImage.image = UIImage(imageLiteralResourceName: imageName)
        }
    }
}
