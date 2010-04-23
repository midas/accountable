module Accountable::Accountor::States
  module AasmTraits
    
    def self.included( base )
      base.class_eval do
        include AASM
        include StateMachineInstanceMethods
        
        aasm_column :status
        aasm_initial_state :passive
        aasm_state :passive
        aasm_state :active, :enter => :do_activate
        aasm_state :suspended, :enter => :do_suspend

        aasm_event :activate do
          transitions :from => :passive, :to => :active
        end
        aasm_event :suspend do
          transitions :from => [:passive, :active], :to => :suspended
        end
        aasm_event :unsuspend do
          transitions :from => :suspended, :to => :active
        end
      end
    end
    
  end
end