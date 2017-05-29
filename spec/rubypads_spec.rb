require "spec_helper"

RSpec.describe Rubypads do
  it "has a version number" do
    expect(Rubypads::VERSION).not_to be nil
  end

  it "sets sandbox mode to true" do
    rubypads = Rubypads.sandbox_mode = true
    expect(rubypads).to be_truthy
  end

  it "it displays an error" do
    rubypads = Rubypads::Client.new('WiZVNLWwGlexpSfpShjs5ua8nVbe6SjNAuqtifQvHsU', 'dgr0A1z2COWoujlQG0dzfRh-A4DGTy38rTOe6Coxg4U')
    ids = [1,2,3]
    feed_id = "testfeed"
    feeds = rubypads.mark_for_update(feed_id, ids)
    expect(feeds[:error]).to eq('you do not have permission to update that feed')
  end
end
