# regex 正则

Regular  expressions  ("RE"s),  as defined in POSIX.2, come in two forms: modern REs (roughly those of egrep; POSIX.2 calls these "extended" REs) and obsolete REs (roughly those of ed(1); POSIX.2 "basic" REs).  

Obsolete REs mostly exist for backward compatibility in some old programs; they will be discussed at the end.  

POSIX.2 leaves some aspects of RE syntax and  semantics  open;  "(!)" marks decisions on these aspects that may not be fully portable to other POSIX.2 implementations.


A (modern) RE is one(!) or more non-empty(!) branches, separated by `'|'`.  It matches anything that matches one of the branches.  
A branch is one(!) or more pieces, concatenated.  It matches a match for the first, followed by a match for the second, etc.


A  piece  is  an  atom  possibly  followed by a single(!) `'*'`, `'+'`, `'?'`, or bound.  
An atom followed by `'*'` matches a sequence of 0 or more matches of the atom.  
An atom followed by `'+'` matches a sequence of 1 or more matches of the atom.  
An atom followed by `'?'` matches a sequence of 0 or 1 matches of the atom.


A bound is `'{'` followed by an unsigned decimal integer, possibly followed by `','` possibly followed by another unsigned decimal integer, always followed by `'}'`.  
The integers must  lie  between  0 and  RE_DUP_MAX  (255(!))  inclusive,  and  if there are two of them, the first may not exceed the second.  

An atom followed by a bound containing one integer i and no comma matches a sequence of exactly i matches of the atom.  
An atom followed by a bound containing one integer i and a comma matches a sequence of i or more matches of the atom.  
An atom followed by a bound containing two integers i and j matches a sequence of i through j (inclusive) matches of the atom.  


An atom is a regular expression enclosed in `"()"` (matching a match for the regular expression), 
an empty set of `"()"` (matching the null string)(!),  
a bracket expression (see below),  
`'.'` (matching any single character),  
`'^'` (matching the null string at the beginning of a line), 
`'$'` (matching the null string at the end of a line), 
a `'\'` followed  by  one  of  the  characters  `"^.[$()|*+?{\"` (matching  that  character  taken  as  an  ordinary  character),  
a  `'\'`  followed  by  any other character(!)  (matching that character taken as an ordinary character, as if the `'\'` had not been
present(!)), 
or a single character with no other significance (matching that character).  

A `'{'` followed by a character other than a digit is  an  ordinary  character,  not  the  beginning  of  a bound(!).  
It is illegal to end an RE with `'\'`.  


A bracket expression is a list of characters enclosed in `"[]"`.  
It normally matches any single character from the list (but see below).  

If the list begins with `'^'`, it matches any single character (but see below) not from the rest of the list.  

If two characters in the list are separated by `'-'`, this is shorthand for the full range of characters between those  two  (inclusive)  in  the collating  sequence,  for  example,  `"[0-9]"`  in ASCII matches any decimal digit.  

It is illegal(!) for two ranges to share an endpoint, for example, `"a-c-e"`.  

Ranges are very collating-sequence-dependent, and portable programs should avoid relying on them.

To include a literal `']'` in the list, make it the first character (following a possible `'^'`).  
To include a literal `'-'`, make it the first or last character, or the second endpoint  of  a  range.
To  use  a literal `'-'` as the first endpoint of a range, enclose it in `"[."` and `".]"`  to make it a collating element (see below).  
With the exception of these and some combinations using `'['` (see next paragraphs), all other special characters, including `'\'`, lose their special significance within a bracket expression.  

Within a bracket expression, a collating element (a character, a multi-character sequence that collates as if it were a single character, or a collating-sequence name for either) enclosed in `"[."` and  `".]"`  stands  for the sequence of characters of that collating element.  

The sequence is a single element of the bracket expression’s list.  
A bracket expression containing a multi-character collating element can thus match more than one character, for example, if the collating sequence includes a "ch" collating element, then the RE `"[[.ch.]]*c"` matches the first five  characters  of"chchcc".  

Within  a  bracket  expression,  a  collating element enclosed in `"[="` and `"=]"` is an equivalence class, standing for the sequences of characters of all collating elements equivalent to that one, including itself.  
(If there are no other equivalent collating elements, the treatment is as if the enclosing delimiters were `"[."` and `".]"`.)  
For example, if o and ^ are the members of an equivalence class, then `"[[=o=]]"`, `"[[=^=]]"`, and `"[o^]"` are all synonymous.  
An equivalence class may not(!) be an endpoint of a range.  