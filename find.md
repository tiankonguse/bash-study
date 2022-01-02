# find

find -- walk a file hierarchy


```
find [-H | -L | -P] [-EXdsx] [-f path] path ... [expression]
find [-H | -L | -P] [-EXdsx] -f path [path ...] [expression]
```

* -name pattern 
  True if the last component of the pathname being examined matches pattern. 
  Special shell pattern matching characters (``['', ``]'', ``*'', and ``?'') may be used as part of pattern. 
  These characters may be matched explicitly by escaping them with a backslash (``\'').
* -iname pattern 
  Like -name, but the match is case insensitive.
* -type t
   True if the file is of the specified type.  
   Possible file types are as follows:
   - b       block special
   - c       character special
   - d       directory
   - f       regular file
   - l       symbolic link
   - p       FIFO
   - s       socket
* -regex pattern
  True if the whole path of the file matches pattern using regular expression.  
  To match a file named `./foo/xyzzy`, you can use the regular expression `.*/[xyz]*` or `.*/foo/.*`, but not `xyzzy` or `/foo/`.
* -iregex pattern
  Like -regex, but the match is case insensitive.
* -path pattern
  True if the pathname being examined matches pattern.  
  Special shell pattern matching characters (`[`, `]`, `*`, and `?`) may be used as part of pattern.  
  These characters may be matched explicitly by escaping them with a backslash (`\`).  
  Slashes (`/`) are treated as normal characters and do not have to be matched explicitly.