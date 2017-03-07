class RecordSetsController < ApplicationController
  def welcome
    @record_sets = current_user ? current_user.record_sets : []
  end
end
