require 'rails_helper'

describe 'config/initializers/error_span' do

  let(:perform) { render file: '/spec/helpers/error_span_view.html.erb' }

  before do
    assign(:model, model)
    model.valid?
  end

  context 'with errors' do

    let(:model) { Tableless.new }

    it 'should render the correct error wrappers' do
      expect(perform).to have_selector('div.has-error') do |content|
        expect(content).to have_selector('input')
        expect(content).to have_selector('span.help-block')
      end
    end
  end

  context 'no errors' do

    let(:model) { Tableless.new(title: 'valid') }

    it 'should render without any errors wrappers' do
      expect(perform).to_not have_selector('div.has-error')
      expect(perform).to_not have_selector('span.help-block')
    end
  end
end
