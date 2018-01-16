class EntriesController < ApplicationController

  def one_contact_method
    entry = Entry.first
    render json: {
                  fn: entry.fn,
                  ln: entry.ln,
                  email: entry.email,
                  p_num: entry.p_num
                  }
  end

  def all_contact_method
    entries = Entry.all
    entries_collection = []
    entries.each do |entry|
      entries_collection << {
                              fn: entry.fn,
                              ln: entry.ln,
                              email: entry.email,
                              p_num: entry.p_num
                              }     
    end
    render json: entries_collection
  end

end








