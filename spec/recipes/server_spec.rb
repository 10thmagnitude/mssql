require_relative '../spec_helper'

describe 'mssql::server' do
  subject { ChefSpec::Runner.new.converge(described_recipe) }

  
  
  # Write quick specs using `it` blocks with implied subjects
  it { should do_something('...') }

  # Write full examples using the `expect` syntax
  it 'does something' do
    expect(subject).to do_something('...')
  end

  # Use an explicit subject
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'does something' do
    expect(chef_run).to do_something('...')
  end
  it 'installs SQL' do
        expect(chef_run).to install_package('SQL Server')
  end
end
