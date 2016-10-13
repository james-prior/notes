Miss Gale footware:

2 spaces per indentation

#!/usr/bin/ruby -w
# coding: utf-8
# -*- coding: utf-8 -*-
# vi: set fileencoding=utf-8 :
# (default is ASCII)
...
__END__ marks end of code (and perhaps beginning of data)
...

source encoding versus default external encoding

    external

        ruby -E utf-8 ;# sets default external encoding

            Encoding.default_external

module Name
  class Name
    def method_name(filename)
      IO.foreach(filename) do |line|
        if line[0,1] == '#'
          next
        end
      end
    end
  end
end

    method names can have wierd prefixes and suffixes (Perl on steroids)
        $ prefix means global
        @ prefix for instance stuff (self.)
        @@ prefix for class stuff (cls.)
        ? suffix for methods that return boolean
        ! suffix for "dangerous" methods, such as modifying args in place
        = suffix for method names for methods that can be lvalues
    _ is allowed inside integer constants

    __END__ that at beginning of a line marks end of code (beginning of data)

    comments
        # to end of line
        =begin that begins multiline comment (embedded document)
            it is common to put the name of a tool that would process this
            after =begin
            blahblahblah
        =end this ends multiline comment
        (=begin and =end must start in first column, w/o leading whitespace)

        documentation comments:
            specially formatted comments can document the APIs
            just before method, class, and module definitions.
            browse them with ri tool
            use rdoc tool to extract them
            (compare to Python's docstrings)

    identifiers
        begin with ASCII letter or underscore
            continue with ASCII letters, numbers, underscore
            or any non-ASCII (printing?) character
        case sensitive
            convention
                constants, class, and module names: LikeThis or LIKE_THIS
                    must begin with ASCII capital letter
                other names: like_this
        $ prefixes global variables
        @ prefixes instance variables
        @@ prefixes class variables
        ? suffix is common convention for methods that return boolean
        = suffix for methods allow them to be lvalue
        ! suffix for methods to indicate that they are dangerous
            danger often means modifying the object

        some operators can be used as method names (to redefine their behavior)

    statements
        one per line
        ending ; is optional
        multiple statements on a line separated by ;
        single statement across multiple lines
            automatically if "incomplete", like ending with binary operator
            also, if first non-whitespace is '.',
            then line is a continuation line
            ending line with \ continues statement on next line

    function calls

        usually function_name(arguments)
        if first character after function name is a space,
        then parentheses are unnecessary. e.g.
            f (2+3)+1 is same as f(6)

    keywords
        __LINE__ __ENCODING__ BEGIN END alias and begin break case class def
        defined? do else elsif end ensure false for if in module next nil not
        or redo rescue retry return self super then true undef unless until
        when while yield

    Numeric
        all are immutable
        usual operators: + - * / **

        Integer
            Fixnum (31 bits) & Bignum (arbitrary precision)
                automatically converted between the two
            literals
                +/-
                0x or 0Xfor hexadecimal
                0b for binary
                0 for octal
                sequence of digits
                _ are allowed within sequence of digits
            /0 causes ZeroDivisionError 
            bitwise operators ~ & | ^ << >>
        Float
            overflow to +/- infinity
            underflow to zero
            literal
                [-+]?[0-9]+[.][0-9]+([eE][-+]?[0-9]+)?
                _ are allowed within mantissa (surrounded by digits)
            0.0/0.0 yields NaN (not a number)
            / 0.0 yields Infinity
        Complex (standard library)
        BigDeciaml (standard library)
            arbitrary precision
        Rational (standard library)
            (integer fractions)
    String
        mutable

        <=1.8.*: sequence of bytes
        >=1.9: sequence of characters (good support for unicode)
        literals
            ''
                only two escape sequences:
                    \' \\ 
                may extend over multiple lines, newlines are part of string
                the following is concatenated without newline to yield 9 chars
                'hello '\
                'world'
            ""
                many escape sequences
                    \" \a \b \e \f \n \r \s \t \v 
                    \C-x control-x where x is any character
                        returns only lowest 5 bits
                    \cx shorthand for \C-x
                    \M-x ( | (1<<7) )
                    \M- and \C- may be combined. e.g.: \M-\C-A
                    \xn or \xnn nn where n are hex digits
                    \[0-7] or \[0-7][0-7] or \[0-7][0-7][0-7] octal
                    \eol (neither \ or newline appear in string)
                        
                    >=1.9:
                        \uxxxx where x are exactly four hex digits
                        \u{hexdigits} hexdigits are variable number of hex 
                            digits
                        \u{hexdigits hexdigits hexdigits}
                            multiple characters, hex separated by spaces
                interpolation
                    #{arbitrary Ruby expression}
                    $globalvariablename (reminiscent of shell)
                    @instancevariablename (reminiscent of shell)
            %q**, %Q**, or %** where * is arbitrary delimiter
                if begins with ( [ { or <,
                then ends with > } ] ) respectively
                delimiters may be escaped with leading \
                If delimiters are ( [ { or <,
                don't need to escape same inside that are "balanced".
            %q** innards follow single quoting rules
            %Q** and %** innards follow single quoting rules
            "here docs" 
            <<SOMELABEL # no space between << and SOMELABEL
            SOMELABEL (must be at beginning of line, and nothing after it)
            greeting + <<HERE + <<THERE + 'world'
            Helllo
            HERE
            These
            THERE
            <<-SOMELABEL # <<- allows whitespace before ending string
                SOMELABEL
            Behaves as "" quoted if first identifier is _not_ quoted
                or if it is quoted with ""
            Behaves as '' quoted if first identifier is quoted with ''
                (actually stricter, don't need to escape anything inside doc)
        String.new
            returns new empty string if no argument
            returns new copy of argument if given string

    `some external command`
    cmd = 'grep'
    %x[#{cmd} -ir hello *] (like doubled quoted string)
    Kernel.`(command) # ` is method name

    array
        untyped, mutable
        indexes start at zero
        negative indexes are from end of array (like Python)
        to append, foo[foo.size] = whatever
        out of bound indexes yield nil, not exception
        literal
            [1,2,3]
            %w[hello world] is same as ['hello', 'world']
            %w| ( [ { < | is same as ['(', '[', '{', '<']
            %W(\s \t \r \n) is same as ["\s", "\t", "\r", "\n"]
            

    Regexp (standard library?)

    range (
        #!!!??? where can they be used besides array indexes?
        #!!!compare to python slices
            #!!!??? are python slices more flexible with increment?
        literal
            1..3 #!!! 1 <= i <= 3
            1...3 #!!! 1 <= i < 3

    hash (dictionary)
        {1=>"one", 2=>"two"}

    if <expression> then (the "then" is optional)
        statements
    end

    while <expression> do (the "do" is optional)
        statements
    end

    for 
        



styleguides
    https://github.com/styleguide/ruby
    https://github.com/bbatsov/ruby-style-guide
    https://github.com/airbnb/ruby
