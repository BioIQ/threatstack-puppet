require 'spec_helper'

describe 'threatstack::configure' do
  let(:facts) { {:osfamily => 'Debian'} }

  it { should contain_exec('configure-threatstack-agent').with(
    :command => "/opt/threatstack/bin/cloudsight setup --deploy-key='xKkRzes' --hostname='test-hostname'  --ruleset='Base Rule Set' "
  )}

end
