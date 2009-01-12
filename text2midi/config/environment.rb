RAILS_GEM_VERSION = '2.2.2' unless defined? RAILS_GEM_VERSION
 require File.join(File.dirname(__FILE__), 'boot')
  Rails::Initializer.run do |config|
   config.time_zone = 'UTC'
   config.action_controller.session = {
     :session_key => '_text2midi_session',
     :secret      => '663cc1fff7aa6026a9506fa4a727d00a3ef923077034805ca3cc78d5e243a9b55b253b1f623dc21744dccea3523a58526bde1180f90fe83b2525212fedede111'
   }
    config.gem "midilib", :version => ">=1.0.0"
  end
