require 'chefspec'
require 'chefspec/berkshelf'

describe 'base::packages' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'installs a package MySQL-client' do
    expect(chef_run).to install_package('MySQL-client')
  end

  it 'installs a package MySQL-shared' do
    expect(chef_run).to install_package('MySQL-shared')
  end
end
