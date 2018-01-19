# ssb-splitter

A quick and dirty hack to compensate for max post length in
[Scuttlebut](https://scuttlebutt.nz) clients.

* Reads in a markdown file
* Splits it into multiple files with as many paragraphs as possible in each
* adds a line to each post indicating which one it is and of how many. E.g. "post 2
  of 12"


Example: 

```
$ ssb-splitter path/to/my/long/post.md
path/to/my/long/post_1.md
path/to/my/long/post_2.md
```

Those 2 lines after the command are the paths to where it has 
written your new file.

## Usage

ssb-splitter path/to/file

## Compiling 

```
crystal build src/ssb-splitter.cr
```

## Contributing

Really? Well, sure. It's written in Crystal. Have fun. 

1. Fork it ( https://github.com/masukomi/ssb-splitter/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [masukomi](https://github.com/masukomi) masukomi - creator, maintainer
