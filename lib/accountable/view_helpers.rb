module Accountable
  module ViewHelpers
    def current_account
      return current_user.account unless current_user.blank?
      nil
    end
  end
end