require 'spec_helper'

describe Alchemy::EssencesHelper do

  let(:element) { FactoryGirl.create(:element, :create_contents_after_create => true) }

  before do
    element.content_by_name('intro').essence.update_attributes(:body => 'hello!')
  end

  it "should render an essence" do
    content = element.content_by_name('intro')
    render_essence(content).should match(/hello!/)
  end

  it "should render an essence view" do
    content = element.content_by_name('intro')
    render_essence_view(content).should match(/hello!/)
  end

  it "should render an essence view by name" do
    render_essence_view_by_name(element, 'intro').should match(/hello!/)
  end

  it "should render an essence view by type" do
    render_essence_view_by_type(element, 'EssenceText').should match(/hello!/)
  end

end
