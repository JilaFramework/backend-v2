module Api
  class SyncController < ApplicationController
    def all
      @entries = Entry.all.order(:id)
      @categories = Category.all.order(:position)
    end
  end
end
