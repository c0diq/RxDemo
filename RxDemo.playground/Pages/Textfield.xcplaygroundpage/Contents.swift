//: A UIKit based Playground for presenting user interface
  
import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class MyViewController : UIViewController {
    var label : UILabel!
    var textField : UITextField!

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        view.addSubview(textField)

        label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view

        // Layout
        textField.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: margins.trailingAnchor),

            label.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            label.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
        ])
    }

    override func viewDidLoad() {
        let text = textField.rx.text.orEmpty

//        let disposeBag = DisposeBag()
//
//        textField.rx.text.orEmpty
//            .map { $0.count }
//            .filter { $0 > 3 }
//            .subscribe(onNext: {
//                print("\($0)")
//            })
//            .disposed(by: disposeBag)

        let filteredText = text
            .filter { $0.count > 3 }
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()

        text
            .scan([]) { (accumulator, newText) in
                return [newText] + accumulator
            }
            .map { $0.prefix(10) }
            .map { $0.joined(separator: "\n") }
            .bind(to: label.rx.text)
    }
}
let window = UIWindow(frame: CGRect(x: 0,
                                    y: 0,
                                    width: 768,
                                    height: 1024))
let viewController = MyViewController()
window.rootViewController = viewController
window.makeKeyAndVisible()
PlaygroundPage.current.liveView = window
