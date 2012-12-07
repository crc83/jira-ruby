require 'spec_helper'

describe JIRA::Resource::Transition do

  let(:client) { mock() }

  it "should find an issue by key or id" do
    response = mock()
    response.stub(:body).and_return('{"id":"5","name":"Resolve issue"}')
    JIRA::Resource::Transition.stub(:collection_path).and_return('/jira/rest/api/2/issue/101/transition')
    client.should_receive(:get).with('/jira/rest/api/2/issue/foo/transition').
      and_return(response)
    client.should_receive(:get).with('/jira/rest/api/2/issue/101/transition').
      and_return(response)

    issue_from_id = JIRA::Resource::Transition.find(client,101)
    issue_from_key = JIRA::Resource::Transition.find(client,'foo')

    issue_from_id.attrs.should == issue_from_key.attrs
  end

  # do I really need this?
  # I need only name and Id
  it "provides direct accessors to the fields" do
    subject = JIRA::Resource::Transition.new(client, :attrs => {'fields' => {'foo' =>'bar'}})
    subject.should respond_to(:foo) 
    subject.foo.should == 'bar'
  end

 
end
