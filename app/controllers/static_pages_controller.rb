class StaticPagesController < ApplicationController
  def home
  	@journal = Journal.new
  	@journals = current_user.journals.order(created_at: :desc) if current_user
  end

  def about
  end

  private

  def private_home
  end
end
