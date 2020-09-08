# README

## SP Log Parser

### Usage

the script can be launched by calling the main.rb and providing an input file.

```
main.rb input.log
```

and the result will look something like this:

```
list of webpages with most page views ordered from most pages views to less page views
/about/2 90 visits
/contact 89 visits
/index 82 visits
/about 81 visits
/help_page/1 80 visits
/home 78 visits
list of webpages with most unique page views ordered from most unique views to less unique views
/index 23 unique visits
/home 23 unique visits
/contact 23 unique visits
/help_page/1 23 unique visits
/about/2 22 unique visits
/about 21 unique visits
```

if the argument is omitted:

```
main.rb
No file has been given.
```

or the file doesn't exist

```
main.rb foo.bar
The file is not found.
```

there is an optional 2nd argument if this is given
it will output the result into this path

```
main.rb input.log output.log
```

### Notes on Validation
The example log file seemed to not contain any invalid entries and the requirements
didn't mention so I assumed the log content is already validated. Both the lines and
the ip addresses. If this assumption is incorrect validators can be easily added.

