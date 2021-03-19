#!/bin/bash

for file in $(find . -iname '*.md' -not -path './_includes/*'); do
   if head -n 1 < "$file" | grep -q '^---'; then
     echo "$file already has front matter";
   else 
     echo "Adding front matter to $file"
     sed -i '1s;^;---\n---\n;' $file
   fi
done
