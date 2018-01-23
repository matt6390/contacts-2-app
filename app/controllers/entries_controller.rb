class EntriesController < ApplicationController

    def index
      entries = Entry.all
      render json: entries.as_json
    end

    def create
        entry = Entry.new(
                              id: params[:id],
                              first_name: params[:fn],
                              middle_name: params[:middle_name],
                              last_name: params[:last_name],
                              bio: params[:bio],
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
       entry.middle_name = params[:middle_name]
       entry.last_name = params[:last_name]
       entry.bio = params[:bio]
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








