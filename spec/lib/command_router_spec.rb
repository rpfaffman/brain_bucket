require 'spec_helper'

describe CommandRouter do
  let(:router) { CommandRouter.new(user) }
  let(:user) { User.create(current_thought_id: old_thought.id) }
  let(:old_thought) { Thought.create(content: "old content") }
  let(:new_thought) { Thought.create(content: "new content") }

  describe "#cd" do
    it "should change the user's current thought to the one associated with the id" do
      expect {
        router.send("cd", new_thought.id.to_s)
      }.to change {
        user.current_thought
      }.from(old_thought).to(new_thought)
    end
  end

  describe "#ls" do
    let(:parent_thought) { Thought.create }

    before do
      user.update(current_thought: parent_thought)
      parent_thought.add_child(old_thought)
      parent_thought.add_child(new_thought)
    end

    it "should return a list of children thoughts associated with parent thought" do
      expect(
        router.send("ls").split("\n")
      ).to eq(
        [
          "* #{old_thought.content}",
          "* #{new_thought.content}"
        ]
      )
    end
  end
end
