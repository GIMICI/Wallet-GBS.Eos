import ThemeKit

class WalletConnectMainViewController: ThemeViewController {
    private let baseView: WalletConnectView
    private let viewModel: WalletConnectMainViewModel

    private let disconnectButton = ThemeButton()

    init?(baseView: WalletConnectView, viewModel: WalletConnectMainViewModel) {
        self.baseView = baseView
        self.viewModel = viewModel

        super.init()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Wallet Connect"

        view.addSubview(disconnectButton)
        disconnectButton.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview().inset(CGFloat.margin6x)
            maker.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(CGFloat.margin6x)
            maker.height.equalTo(CGFloat.heightButton)
        }

        disconnectButton.apply(style: .primaryRed)
        disconnectButton.setTitle("Disconnect", for: .normal)
        disconnectButton.addTarget(self, action: #selector(onDisconnect), for: .touchUpInside)
    }

    @objc private func onDisconnect() {
        baseView.viewModel.onFinish()
    }

}