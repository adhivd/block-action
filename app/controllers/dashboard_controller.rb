class DashboardController < ApplicationController
    before_action :authenticate_user!

  def index
      @user = current_admin || current_holder
      if @user == current_admin
          @adminLawsuits = @user.lawsuits
      else
          @userClaims = @user.claims
      end
  end

  def register
      @user = current_admin || current_holder
      lawsuit = Lawsuit.find_by(id: params['lawsuit'])
      puts 'LAWSUIT'
      puts lawsuit
      @claim = Claim.create(user_id: @user.id, lawsuit_id: lawsuit.id)
      @claim.stake = lawsuit.settlement
      puts "user id"
      puts @user
      puts @claim.user_id
      puts "law id"
      puts lawsuit
      puts @claim.lawsuit_id
      @claim.save!
      puts "Save this"
      redirect_to '/'
  end
end
