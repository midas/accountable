$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
  
module Accountable
  VERSION = File.readlines( File.expand_path( '../VERSION', __FILE__ ) ).first
end