import UIKit
import SnapKit

class CatDetailViewController: UIViewController, CatDetailViewPort {
    let imageView = UIImageView()
    let cats: [Cat]
    var selectedIndex:Int = 0
    weak var router: CatDetailRouter?
    lazy var adapter: CatDetailAdapter = {
        return CatDetailAdapter(cats: self.cats, selectedIndex: self.selectedIndex, viewPort: self)
    }()
    
    init(cats: [Cat], selectedIndex: Int, router: CatDetailRouter) {
        let podBundle = Bundle(for: CatFeatureRouter.self)
        let bundleURL = podBundle.url(forResource: "CatFeature", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)
        let image = UIImage(named:"\(cats[selectedIndex].imageName).jpg", in: bundle, compatibleWith: nil)
        
        imageView.image = image
        self.cats = cats
        self.selectedIndex = selectedIndex
        self.router = router
        super.init(nibName: nil, bundle: nil)
        title = cats[selectedIndex].imageName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.accessibilityIdentifier = "imageView"
        imageView.contentMode = .scaleAspectFill
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showCatImage(index: Int) {
        
        let podBundle = Bundle(for: CatFeatureRouter.self)
        let bundleURL = podBundle.url(forResource: "CatFeature", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)
        let image = UIImage(named:"\(cats[index].imageName).jpg", in: bundle, compatibleWith: nil)
        
        imageView.image = image
        imageView.setNeedsDisplay()
        title = cats[index].imageName
    }
    
    @objc func imageTapped() {
        adapter.handleTapImage()
    }
}
