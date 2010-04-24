module Accountable::Accountor::States
  module StateMachineInstanceMethods
    protected

    def do_activate
      self.activated_at = Time.now.utc
    end
    
    def do_suspend
      self.suspended_at = Time.now.utc
    end
  end
end