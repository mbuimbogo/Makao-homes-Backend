class SessionsController < ApplicationController

    def create
        client = Client.find_by(username: params[:username])
        if client&.authenticate(params[:password])
            session[:client_id] = client.id
            render json: client, status: :created
        else
            render json: { error: "Invalid username or password" }, status: :unauthorized
        end
    end

    def show
        client = Client.find_by(id: session[:client_id])
        if client 
            render json: client
        else
            render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    def destroy
        session.delete :client_id
        head :no_content
    end

end
