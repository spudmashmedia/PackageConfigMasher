#!/bin/bash
# Package Config Masher by Spudmash Media
# USAGE:
#    An audit tool to consolidate all .NET repositorie's package.config
#    Helps identify which Nuget packages used across all projects.
###############################################################################

echo ""
echo "stage 1: crawl solution file, get csproj locations"

cat $1 | grep ..*.csproj | cut -f2 -d'=' | cut -f2 -d',' | sed 's/"//g' | rev | cut -d'\' -f1 | rev | xargs -I file find . -name file | xargs -I file dirname file > directories.1

echo "stage 2: inject packages.config to directory"
cat directories.1 | xargs -I file echo file"/packages.config" | xargs -I file bash -c 'if [ -f file ]; then cat file; fi' > merge.2

echo "stage 3: save consolidated packages.config"
sort merge.2 | uniq > $2

echo "final: clean up temp files"
rm directories.1
rm merge.2

echo ""
echo "Results from package.config consolidation:"
echo ""
cat $2

echo ""
