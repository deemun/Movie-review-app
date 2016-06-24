 class SessionsController < ApplicationController

      def new  #new calls create 
      end

      def create
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
          session[:user_id] = user.idser = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          
          redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
        else
          render :new
        end
          
          redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
        else
          render :new
        end
      end

      def destroy
      session[:user_id] = nil
      redirect_to movies_path, notice: "Adios!"
      end

    end