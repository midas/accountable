module Accountable::Accountor::States
  module StateMachineInstanceMethods
    protected

    def do_activate
      self.activated_at = Time.now.utc if self.respond_to? :activated_at
    end
    
    def do_suspend
      self.suspended_at = Time.now.utc if self.respond_to? :suspended_at
    end
  end
end