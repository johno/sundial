require 'spec_helper'

describe "blocks/new" do
  before(:each) do
    assign(:block, stub_model(Block,
      :task_id => 1
    ).as_new_record)
  end

  it "renders new block form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", blocks_path, "post" do
      assert_select "input#block_task_id[name=?]", "block[task_id]"
    end
  end
end
