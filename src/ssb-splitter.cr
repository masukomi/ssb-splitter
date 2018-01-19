require "./ssb-splitter/*"


if File.basename(PROGRAM_NAME) == "ssb-splitter"
  if ARGV.size != 1
    STDERR.puts("Usage: ssb-splitter path/to/file")
    exit(1)
  end
  s = SsbSplitter::Splitter.new()
  s.read(ARGV[0].to_s)
  s.write(true)
end

