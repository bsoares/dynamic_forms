module Admin
  class AdminController < ApplicationController
    def send_conditional_flash_message(success)
      if success
        flash[:success] = t(".flash.success")
      else
        flash[:error] = t(".flash.error")
      end
    end
  end
end
