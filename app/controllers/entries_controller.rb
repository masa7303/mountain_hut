class EntriesController < ApplicationController

  def index
    @entries = Entry.order(posted_at: :desc).page(params[:page]).per(3)
  end

  def show
    @entry = Entry.find(params[:id])
  end
end
