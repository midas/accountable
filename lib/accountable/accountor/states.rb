module Accountable::Accountor
  module States
    autoload :AasmTraits,                     'accountable/accountor/states/aasm_traits'
    autoload :StateMachineInstanceMethods,    'accountable/accountor/states/state_machine_instance_methods'
    autoload :StateMachineTraits,             'accountable/accountor/states/state_machine_traits'
  end
end