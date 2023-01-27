class Waitlist::UsersController < ApplicationController

  # GET /waitlist/users/new
  def new
    @waitlist_user = Waitlist::User.new
  end

  # POST /waitlist/users or /waitlist/users.json
  def create
    @waitlist_user = Waitlist::User.new(waitlist_user_params)

    respond_to do |format|
      if @waitlist_user.save
        # Set waitlist_user in session
        session[:waitlist_user] = @waitlist_user.id

        format.html { redirect_to app_index_url, notice: I18n.t('waitlist.users.controllers.create.success') }
        format.json { render :show, status: :created, location: @waitlist_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @waitlist_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def waitlist_user_params
      params.require(:waitlist_user).permit(:email_address, :business_type, :notes)
    end
end
