class EntriesController < ApplicationController

    def index
      entries = Entry.all
      render json: entries.as_json
    end

    def create
        entry = Entry.new(
                              id: params[:id],
                              first_name: params[:first_name],
                              last_name: params[:last_name],
                              email: params[:email],
                              p_num: params[:p_num]
                              )
        entry.save
        render json: entry.as_json    
    end

    def show
        entry = Entry.find(params[:id])
        render json: entry.as_json
    end

    def update
       entry = Entry.find(params[:id])

       entry.id = params[:id]
       entry.first_name = params[:first_name]
       entry.last_name = params[:last_name]
       entry.email = params[:email]
       entry.p_num = params[:p_num]
       entry.save

       render json: entry.as_json 
    end

    def destroy
        entry = Entry.find(params[:id])
        entry.destroy

        render json: {message: "Congrats, you have succesfully destroyed contact ##{entry.id}"} 
    end

end








