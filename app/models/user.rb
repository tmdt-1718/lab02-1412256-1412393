class User < ApplicationRecord
    has_many :messages
    has_many :receivers
	  has_secure_password

    def self.authenticate!(session_params)
		user = User.authenticate(session_params)

		if user.nil?
			raise RecordNotFound
		else
			user
		end
	end

    def self.authenticate(session_params)
        user = User.find_by(email: session_params[:email])
        if user.nil?
			raise RecordNotFound
		else

            if user.authenticate(session_params[:password])
                user
            else
                false
            end
        end
    end

    def self.authenticate?(session_params)
        !User.authenticate(session_params).nil?
    end
end
