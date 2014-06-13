require 'spec_helper'

describe 'mirror' do

  ['apache', 'vsftpd', 'rsync'].each do |modules|
  
    it "includes #{modules}" do
      should contain_class(modules)
    end
 
  end

end
