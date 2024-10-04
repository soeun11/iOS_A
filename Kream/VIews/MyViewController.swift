import UIKit
import SnapKit

class MyViewController: UIViewController {

   
    let settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let cameraButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_image") // 프로필 이미지 설정
        imageView.layer.cornerRadius = 45 // 원형 이미지로 만들기 위한 설정 (이미지 크기에 맞춤)
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jeong_iOS"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left // 왼쪽 정렬로 설정
        return label
    }()
    
    let followersLabel: UILabel = {
        let label = UILabel()
        label.text = "팔로워 326  팔로잉 20"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left // 왼쪽 정렬로 설정
        return label
    }()
    
    // 사용자 이름과 팔로워/팔로잉 레이블을 수직으로 정렬할 StackView
    let nameAndFollowersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        return stackView
    }()
    
   
    let profileInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        return stackView
    }()
    
    let profileEditButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 관리", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .light)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let profileShareButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 공유", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .light)
        button.layer.cornerRadius = 10
        return button
    }()
    
    // 하단의 빈 뷰 (구분선 대신 사용)
    let bottomSpacingView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        
        navigationItem.title = nil
        
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
       
        view.addSubview(settingsButton)
        view.addSubview(cameraButton)
        view.addSubview(profileInfoStackView)
        view.addSubview(profileEditButton)
        view.addSubview(profileShareButton)
        view.addSubview(bottomSpacingView)
        
        
        nameAndFollowersStackView.addArrangedSubview(usernameLabel)
        nameAndFollowersStackView.addArrangedSubview(followersLabel)
        
        profileInfoStackView.addArrangedSubview(profileImageView)
        profileInfoStackView.addArrangedSubview(nameAndFollowersStackView)
        
       
        setupLayout()
        
       
        settingsButton.addTarget(self, action: #selector(handleSettingsButtonTapped), for: .touchUpInside)
    }
    
   
    @objc func handleSettingsButtonTapped() {
        let settingVC = SettingViewController()
        
        
        navigationController?.pushViewController(settingVC, animated: true)
    }
    
    func setupLayout() {
        
        settingsButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
        
        cameraButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.width.height.equalTo(25)
        }
        
        // 프로필 정보 StackView
        profileInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(settingsButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30) // 왼쪽 여백 설정
        }
        
        // 프로필
        profileImageView.snp.makeConstraints { make in
            make.width.height.equalTo(90) // 원형 이미지로 설정
        }
        
        // 프로필 관리 버튼
        profileEditButton.snp.makeConstraints { make in
            make.top.equalTo(profileInfoStackView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalTo(view.snp.centerX).offset(-10)
            make.height.equalTo(26)
        }
        
        // 프로필 공유 버튼
        profileShareButton.snp.makeConstraints { make in
            make.top.equalTo(profileInfoStackView.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.centerX).offset(10)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(26)
        }
        
        // 하단 빈 뷰 (구분선 대체) 레이아웃 설정
        bottomSpacingView.snp.makeConstraints { make in
            make.top.equalTo(profileEditButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20) // 빈 뷰 높이 설정
        }
    }
}

