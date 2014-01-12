require "spec_helper"

require "generator_spec/test_case"

require "generators/quick-templater/layout/layout_generator"

describe QuickTemplater::Layout do
  include GeneratorSpec::TestCase
  destination File.expand_path('../../tmp', __FILE__)

  before(:all) do
    prepare_destination
  end

  it 'creates layout with name test1' do
    run_generator %w(test1)
    assert_file 'app/views/layouts/test1.html.erb'
  end

  describe 'are generated' do
    describe 'with default template engine' do
      before {run_generator}
      it 'application.html.erb' do
        assert_file 'app/views/layouts/application.html.erb'
      end
    end
    describe 'with haml' do
      before {run_generator %w(--engine=haml)}
      it 'application.html.haml' do
        assert_file 'app/views/layouts/application.html.haml'
      end
    end
    describe 'with slim' do
      before do
        run_generator %w(--engine=slim)
      end
      it 'application.html.slim' do
        assert_file 'app/views/layouts/application.html.slim'
      end
    end
  end
end