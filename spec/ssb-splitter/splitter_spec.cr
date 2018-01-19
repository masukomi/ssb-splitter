require "../spec_helper"

describe SsbSplitter::Splitter do
  it "makes file names with suffixes" do
    s = SsbSplitter::Splitter.new
    file_names = s.make_file_names("foo/bar.md", 1)
    file_names.first.should(eq("bar_1.md"))
  end

  it "makes file names without suffixes" do
    s = SsbSplitter::Splitter.new
    file_names = s.make_file_names("foo/bar", 1)
    file_names.first.should(eq("bar_1"))
  end

  it "makes multiple file names when asked" do
    s = SsbSplitter::Splitter.new
    file_names = s.make_file_names("foo/bar.md", 2)
    file_names.should(eq(["bar_1.md", "bar_2.md"]))
  end
end
