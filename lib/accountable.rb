$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'accountable/active_record_extensions'

module Accountable
  VERSION = File.exist?(File.expand_path( '../VERSION', __FILE__ )) ? 
    File.readlines( File.expand_path( '../VERSION', __FILE__ ) ).first : 
    ""
  
  autoload :Accountee,                      'accountable/accountee'
  autoload :Accountor,                      'accountable/accountor'
  autoload :AccountorsAsset,                'accountable/accountors_asset'
  autoload :ControllerActions,              'accountable/controller_actions'
  autoload :ControllerHelpers,              'accountable/controller_helpers'
  autoload :CurrentMethods,                 'accountable/current_methods'
  autoload :ViewHelpers,                    'accountable/view_helpers'
end

ActiveRecord::Base.send( :include, Accountable::ActiveRecordExtensions ) if defined? ActiveRecord::Base
if defined?( ActionView::Base )
  ActionView::Base.send( :include, Accountable::ViewHelpers ) unless ActionView::Base.include? Accountable::ViewHelpers
end
if defined?( ActionController::Base )
  ActionController::Base.send( :include, Accountable::ControllerHelpers ) unless ActionController::Base.include? Accountable::ControllerHelpers
  ActionController::Base.send( :include, Accountable::ControllerActions ) unless ActionController::Base.include? Accountable::ControllerActions
end