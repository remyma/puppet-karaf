require 'serverspec'
set :backend, :exec

package 'net-tools'

# Check that user and group have been created.
describe user('karaf') do
  it { should exist }
  it { should belong_to_group 'karaf' }
end

# Check that karaf instance1 is up.
describe service('instance1') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8101) do
  it { should be_listening }
end

describe port(1099) do
  it { should be_listening }
end

# Check that karaf instance2 is up.
describe service('instance2') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8102) do
  it { should be_listening }
end
