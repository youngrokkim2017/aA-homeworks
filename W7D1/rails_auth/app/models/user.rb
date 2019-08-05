class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :password_digest, presence: { message: 'Password can''t be blank'}
    validates :session_token, presence: true, uniqueness: true
    validates :password, length: { minimum: 6, allow_nil: true }
    before_validation :ensure_session_token
    
    attr_reader :password
    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end
    #This will only return a user if the username/password is correct.
    
    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
end
