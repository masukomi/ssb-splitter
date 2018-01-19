module SsbSplitter
  class SplitFile
    
    def initialize()
      @paragraphs = Array(String).new
    end
    def append(paragraph : String)
      @paragraphs.push paragraph
    end
    def to_s() : String
      @paragraphs.join("\n\n")
    end
    def write_to(path : String, footer : String? = nil)
      content = self.to_s
      if !footer.nil?
        content += "\n\n#{footer}"
      end
      File.write(path, content)
    end
  end
end
