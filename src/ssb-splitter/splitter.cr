require "./split_file.cr"
module SsbSplitter
  class Splitter
    MAX_SIZE = 4000
    def initialize()
      @file_path = ""
      @files = Array(SplitFile).new
    end
    def read(file_path : String)
      @file_path = file_path.as(String)
      contents = File.read(@file_path)
      paragraphs = split_by_para(contents)
      @files = split_paras_into_files(paragraphs)
    end
    def write(print : Bool = false)
      count = @files.size
      file_names = make_file_names(@file_path, count)
      dirname = File.dirname(@file_path) + "/"
      (0...count).each do | idx |
        path = dirname + file_names[idx]
        @files[idx].write_to(path, "post #{idx +1} of #{count}")
        puts path if print
      end
    end

    def make_file_names(file_path : String, count : Int32) : Array(String)
      suffix = file_path =~ /\.\w+$/ ? file_path.sub(/.*?(?=\.\w+$)/, "") : nil
      basename = suffix.nil? ? File.basename(file_path) : File.basename(file_path, suffix)

      file_names = Array(String).new
      (1..count).each do | x |
        file_names.push( "#{basename}_#{x}#{suffix}" )
      end
      file_names
    end
    def split_paras_into_files(paragraphs) : Array(SplitFile)
      running_count = 0
      sfs = Array(SplitFile).new()
      sf = SplitFile.new()
      paragraphs.each do | para |
        if running_count + para.bytesize < MAX_SIZE
          sf.append(para)
          running_count += para.bytesize
        else
          sfs.push(sf)
          sf = SplitFile.new()
          sf.append(para)
          running_count = 0
        end
      end
      sfs.push(sf)
      return sfs
    end
    
    def split_by_para(str : String) : Array(String)
      return str.split(/\n\n/)
    end
  end
end
