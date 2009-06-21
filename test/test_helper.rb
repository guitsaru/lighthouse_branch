require 'rubygems'
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'lighthouse_branch'

LIGHTHOUSE_ACCOUNT = YAML::load(File.open(File.join(File.dirname(__FILE__), 'lighthouse_account.yml')))

class Test::Unit::TestCase
end
