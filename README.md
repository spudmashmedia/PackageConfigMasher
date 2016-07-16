# Package Config Masher
An audit tool to consolidate all .NET package.config files.
Helps identify which Nuget packages used across all projects - unique packages are identified.

Originally written as a one liner hack

```
find . -name '*.csproj' | cut -f2 -d'=' | cut -f2 -d',' | sed 's/"//g' | rev | cut -d'\' -f1 | rev | xargs -I file find . -name file | xargs -I file dirname file
| xargs -I file echo file"/packages.config" | xargs -I file bash -c 'if [ -f file ]; then cat file; fi' | sort | uniq
```


## Installation
Either use the script or the oneliner:

```
find . -name '*.csproj' | cut -f2 -d'=' | cut -f2 -d',' | sed 's/"//g' | rev | cut -d'\' -f1 | rev | xargs -I file find . -name file | xargs -I file dirname file
| xargs -I file echo file"/packages.config" | xargs -I file bash -c 'if [ -f file ]; then cat file; fi' | sort | uniq
```

## Usage
add to the root of a folder then run
> bash pcm.sh [.net solution name] [output filename]

## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History
v1 Spudmash Media

## License
The MIT License (MIT)

Copyright (c) 2016 Spudmash Media Pty Ltd

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
