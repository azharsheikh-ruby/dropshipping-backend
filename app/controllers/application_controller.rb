class ApplicationController < ActionController::API
    def encode_token(payload)
      JWT.encode(payload, ENV['SECRET_KEY_BASE'], 'HS256')
    end
  
    def auth_header
      request.headers['Authorization']
    end
  
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        begin
          JWT.decode(token, ENV['SECRET_KEY_BASE'], true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
  
    def current_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @current_user ||= User.find_by(id: user_id)
      end
    end
  
    def authorize
      render json: { message: 'Please log in' }, status: :unauthorized unless current_user
    end
  end
  