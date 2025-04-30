class Api::V1::AuthController < ApplicationController
    def login
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        token = encode_token({ user_id: user.id })
        render json: { success: true, message: "Login Successfull", user: UserSerializer.new(user), token: token }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end

    def signup
    user = User.new(user_params)
        if user.save
            token = encode_token({ user_id: user.id })
            render json: { success: true, message: "Signup successful", user: UserSerializer.new(user), token: token }, status: :created
        else
            render json: { success: false, error: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
  