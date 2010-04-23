module Accountable
  module ControllerActions
    def self.included( base )
      base.instance_eval do
        before_filter :set_currents
      end
      base.send( :include, InstanceMethods )
    end

    module InstanceMethods
      protected

      def set_currents
        User.current = current_user
        Account.current = current_account
      end
    end
  end
end