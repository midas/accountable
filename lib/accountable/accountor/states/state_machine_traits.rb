module Accountable::Accountor::States
  module StateMachineTraits
    
    def self.included( base )
      base.class_eval do
        include StateMachineInstanceMethods

        state_machine :status, :initial => :passive do
          state :passive, :active, :suspended

          event :activate do
            transition [:passive] => :active
          end
          after_transition :on => :active, :do => :do_activate

          event :suspend do
            transition  [:passive, :active] => :suspended
          end
          after_transition :on => :active, :do => :do_suspend
          
          event :unsuspend do
            transition [:suspended] => :active
          end
        end
      end
    end
  
  end
end