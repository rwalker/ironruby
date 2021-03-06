#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.6
# from Racc grammer file "".
#

require 'racc/parser.rb'
module Reginald
  class Parser < Racc::Parser

def self.parse_regexp(regexp)
  parser = new
  parser.options_stack << {
    :multiline => (regexp.options & Regexp::MULTILINE != 0),
    :ignorecase => (regexp.options & Regexp::IGNORECASE != 0),
    :extended => (regexp.options & Regexp::EXTENDED != 0)
  }

  expression = parser.scan_str(regexp.source)
  expression.options = regexp.options
  expression
end

attr_accessor :options_stack

def initialize
  @capture_index = 0
  @capture_index_stack = []
  @options_stack = []
end

##### State transition tables begin ###

racc_action_table = [
    22,    62,    32,    26,    66,    32,    32,    52,    54,    31,
    71,    32,    61,    72,    59,    28,    30,    14,    16,    18,
    19,    20,    21,    23,    24,    25,    27,    29,    13,    51,
    53,    55,    57,     3,    32,    77,     5,     7,     9,    11,
    41,    39,    79,     3,     2,     4,     5,     7,     9,    11,
    53,    55,    57,     3,     2,     4,     5,     7,     9,    11,
    53,    55,    57,     3,     2,     4,     5,     7,     9,    11,
    53,    55,    57,     3,     2,     4,     5,     7,     9,    11,
    53,    55,    57,     3,     2,     4,     5,     7,     9,    11,
    53,    55,    57,     3,     2,     4,     5,     7,     9,    11,
    53,    55,    57,     3,     2,     4,     5,     7,     9,    11,
    46,    34,    47,    26,     2,     4,    35,    36,    37,    34,
    67,    53,    55,    57,    35,    36,    37,    42,    43,    60,
    43,    44,    50,    44,    75,    53,    55,    57,    69 ]

racc_action_check = [
     3,    50,    64,     3,    56,    65,    40,    39,    39,     6,
    64,     6,    50,    65,    40,     3,     3,     3,     3,     3,
     3,     3,     3,     3,     3,     3,     3,     3,     3,    39,
    39,    39,    39,    11,    73,    69,    11,    11,    11,    11,
    15,    11,    73,     8,    11,    11,     8,     8,     8,     8,
    70,    70,    70,    54,     8,     8,    54,    54,    54,    54,
    67,    67,    67,    66,    54,    54,    66,    66,    66,    66,
    63,    63,    63,    52,    66,    66,    52,    52,    52,    52,
    51,    51,    51,    32,    52,    52,    32,    32,    32,    32,
    74,    74,    74,    48,    32,    32,    48,    48,    48,    48,
    75,    75,    75,     0,    48,    48,     0,     0,     0,     0,
    22,    10,    31,    22,     0,     0,    10,    10,    10,    33,
    58,    58,    58,    58,    33,    33,    33,    17,    17,    45,
    45,    17,    37,    45,    68,    68,    68,    68,    62 ]

racc_action_pointer = [
   100,   nil,   nil,    -5,   nil,   nil,     9,   nil,    40,   nil,
   100,    30,   nil,   nil,   nil,    36,   nil,   123,   nil,   nil,
   nil,   nil,   105,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   112,    80,   108,   nil,   nil,   nil,   124,   nil,    -5,
     4,   nil,   nil,   nil,   nil,   125,   nil,   nil,    90,   nil,
    -7,    45,    70,   nil,    50,   nil,    -8,   nil,    86,   nil,
   nil,   nil,   130,    35,     0,     3,    60,    25,   100,    16,
    15,   nil,   nil,    32,    55,    65,   nil,   nil,   nil,   nil,
   nil,   nil ]

racc_action_default = [
   -51,   -13,   -19,   -51,   -20,   -11,   -51,   -12,    -2,   -14,
    -6,   -51,    -7,   -43,   -32,   -51,   -33,   -51,   -34,   -35,
   -36,   -37,   -29,   -38,   -39,   -40,   -28,   -41,   -30,   -42,
   -31,   -51,   -51,    -4,   -23,   -21,   -22,   -51,    -5,   -51,
   -51,    -8,    -9,   -27,   -26,   -51,   -29,    82,    -1,    -3,
   -51,   -51,   -51,   -48,   -51,   -49,   -51,   -50,   -51,   -15,
   -10,   -25,   -51,   -51,   -51,   -51,   -51,   -51,   -51,   -51,
   -51,   -17,   -18,   -51,   -51,   -51,   -47,   -24,   -44,   -16,
   -45,   -46 ]

racc_goto_table = [
     6,    33,    58,    17,    38,    48,    56,    15,   nil,   nil,
   nil,    40,   nil,   nil,    63,   nil,   nil,   nil,   nil,   nil,
   nil,    68,    45,   nil,   nil,   nil,    70,    49,   nil,   nil,
    74,    76,   nil,    78,   nil,   nil,   nil,    80,    81,   nil,
   nil,    33,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    64,   nil,    65,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    73 ]

racc_goto_check = [
     1,     3,    10,     7,     4,     2,     9,     6,   nil,   nil,
   nil,     1,   nil,   nil,    10,   nil,   nil,   nil,   nil,   nil,
   nil,    10,     7,   nil,   nil,   nil,    10,     4,   nil,   nil,
    10,    10,   nil,    10,   nil,   nil,   nil,    10,    10,   nil,
   nil,     3,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,     1,   nil,     1,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,     1 ]

racc_goto_pointer = [
   nil,     0,   -27,    -7,    -6,   nil,     4,     0,   nil,   -33,
   -37 ]

racc_goto_default = [
   nil,   nil,     8,    10,   nil,    12,   nil,   nil,     1,   nil,
   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  3, 39, :_reduce_1,
  1, 39, :_reduce_2,
  3, 40, :_reduce_3,
  2, 40, :_reduce_4,
  2, 40, :_reduce_5,
  1, 40, :_reduce_none,
  1, 41, :_reduce_none,
  3, 41, :_reduce_8,
  3, 41, :_reduce_9,
  4, 41, :_reduce_10,
  1, 41, :_reduce_11,
  1, 41, :_reduce_12,
  1, 41, :_reduce_13,
  1, 41, :_reduce_14,
  3, 43, :_reduce_15,
  6, 43, :_reduce_16,
  5, 43, :_reduce_17,
  5, 43, :_reduce_18,
  1, 46, :_reduce_none,
  1, 46, :_reduce_none,
  1, 42, :_reduce_none,
  1, 42, :_reduce_none,
  1, 42, :_reduce_none,
  5, 42, :_reduce_24,
  3, 42, :_reduce_25,
  2, 45, :_reduce_26,
  2, 45, :_reduce_27,
  1, 45, :_reduce_none,
  1, 45, :_reduce_none,
  1, 44, :_reduce_30,
  1, 44, :_reduce_31,
  1, 44, :_reduce_32,
  1, 44, :_reduce_33,
  1, 44, :_reduce_34,
  1, 44, :_reduce_35,
  1, 44, :_reduce_36,
  1, 44, :_reduce_37,
  1, 44, :_reduce_38,
  1, 44, :_reduce_39,
  1, 44, :_reduce_40,
  1, 44, :_reduce_41,
  1, 44, :_reduce_42,
  1, 44, :_reduce_43,
  4, 47, :_reduce_44,
  4, 47, :_reduce_45,
  4, 47, :_reduce_46,
  3, 47, :_reduce_47,
  1, 48, :_reduce_48,
  1, 48, :_reduce_49,
  1, 48, :_reduce_50 ]

racc_reduce_n = 51

racc_shift_n = 82

racc_token_table = {
  false => 0,
  :error => 1,
  :BAR => 2,
  :LBRACK => 3,
  :RBRACK => 4,
  :NEGATE => 5,
  :CCLASS => 6,
  :DOT => 7,
  :CHAR => 8,
  :LPAREN => 9,
  :RPAREN => 10,
  :QMARK => 11,
  :COLON => 12,
  :NAME => 13,
  :L_ANCHOR => 14,
  :R_ANCHOR => 15,
  :STAR => 16,
  :PLUS => 17,
  :LCURLY => 18,
  :RCURLY => 19,
  "alnum" => 20,
  "alpha" => 21,
  "ascii" => 22,
  "blank" => 23,
  "cntrl" => 24,
  "digit" => 25,
  "graph" => 26,
  "lower" => 27,
  "print" => 28,
  "punct" => 29,
  "space" => 30,
  "upper" => 31,
  "word" => 32,
  "xdigit" => 33,
  :MINUS => 34,
  :MULTILINE => 35,
  :IGNORECASE => 36,
  :EXTENDED => 37 }

racc_nt_base = 38

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "BAR",
  "LBRACK",
  "RBRACK",
  "NEGATE",
  "CCLASS",
  "DOT",
  "CHAR",
  "LPAREN",
  "RPAREN",
  "QMARK",
  "COLON",
  "NAME",
  "L_ANCHOR",
  "R_ANCHOR",
  "STAR",
  "PLUS",
  "LCURLY",
  "RCURLY",
  "\"alnum\"",
  "\"alpha\"",
  "\"ascii\"",
  "\"blank\"",
  "\"cntrl\"",
  "\"digit\"",
  "\"graph\"",
  "\"lower\"",
  "\"print\"",
  "\"punct\"",
  "\"space\"",
  "\"upper\"",
  "\"word\"",
  "\"xdigit\"",
  "MINUS",
  "MULTILINE",
  "IGNORECASE",
  "EXTENDED",
  "$start",
  "expression",
  "branch",
  "atom",
  "quantifier",
  "group",
  "ctype",
  "bracket_expression",
  "anchor",
  "options",
  "modifier" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

def _reduce_1(val, _values, result)
 result = Expression.new(Alternation.reduce(val[0], val[2])) 
    result
end

def _reduce_2(val, _values, result)
 result = Expression.reduce(val[0]) 
    result
end

def _reduce_3(val, _values, result)
            val[1].quantifier = val[2]
            result = Expression.reduce(val[0], val[1])
          
    result
end

def _reduce_4(val, _values, result)
 result = Expression.reduce(val[0], val[1]) 
    result
end

def _reduce_5(val, _values, result)
            val[0].quantifier = val[1]
            result = val[0]
          
    result
end

# reduce 6 omitted

# reduce 7 omitted

def _reduce_8(val, _values, result)
 result = val[1] 
    result
end

def _reduce_9(val, _values, result)
 result = CharacterClass.new(val[1]) 
    result
end

def _reduce_10(val, _values, result)
 result = CharacterClass.new(val[2]); result.negate = true 
    result
end

def _reduce_11(val, _values, result)
 result = CharacterClass.new(val[0]) 
    result
end

def _reduce_12(val, _values, result)
 result = CharacterClass.new('.') 
    result
end

def _reduce_13(val, _values, result)
 result = Anchor.new(val[0]) 
    result
end

def _reduce_14(val, _values, result)
 result = Character.new(val[0]) 
    result
end

def _reduce_15(val, _values, result)
          result = Group.new(val[1])
          result.index = @capture_index_stack.pop
        
    result
end

def _reduce_16(val, _values, result)
          result = Group.new(val[4]);
          result.capture = false;
          options = val[2];
          result.expression.multiline  = options[:multiline];
          result.expression.ignorecase = options[:ignorecase];
          result.expression.extended   = options[:extended];
          @options_stack.pop
        
    result
end

def _reduce_17(val, _values, result)
          result = Group.new(val[3]);
          result.capture = false;
        
    result
end

def _reduce_18(val, _values, result)
          result = Group.new(val[3]);
          result.name = val[2];
          result.index = @capture_index_stack.pop
        
    result
end

# reduce 19 omitted

# reduce 20 omitted

# reduce 21 omitted

# reduce 22 omitted

# reduce 23 omitted

def _reduce_24(val, _values, result)
 result = val.join 
    result
end

def _reduce_25(val, _values, result)
 result = val.join 
    result
end

def _reduce_26(val, _values, result)
 result = val.join 
    result
end

def _reduce_27(val, _values, result)
 result = val.join 
    result
end

# reduce 28 omitted

# reduce 29 omitted

def _reduce_30(val, _values, result)
 result = CharacterClass::ALNUM 
    result
end

def _reduce_31(val, _values, result)
 result = CharacterClass::ALPHA 
    result
end

def _reduce_32(val, _values, result)
 result = CharacterClass::ASCII 
    result
end

def _reduce_33(val, _values, result)
 result = CharacterClass::BLANK 
    result
end

def _reduce_34(val, _values, result)
 result = CharacterClass::CNTRL 
    result
end

def _reduce_35(val, _values, result)
 result = CharacterClass::DIGIT 
    result
end

def _reduce_36(val, _values, result)
 result = CharacterClass::GRAPH 
    result
end

def _reduce_37(val, _values, result)
 result = CharacterClass::LOWER 
    result
end

def _reduce_38(val, _values, result)
 result = CharacterClass::PRINT 
    result
end

def _reduce_39(val, _values, result)
 result = CharacterClass::PUNCT 
    result
end

def _reduce_40(val, _values, result)
 result = CharacterClass::SPACE 
    result
end

def _reduce_41(val, _values, result)
 result = CharacterClass::UPPER 
    result
end

def _reduce_42(val, _values, result)
 result = CharacterClass::WORD  
    result
end

def _reduce_43(val, _values, result)
 result = CharacterClass::XDIGIT 
    result
end

def _reduce_44(val, _values, result)
            @options_stack << result = { val[1] => false, val[2] => false, val[3] => false }
          
    result
end

def _reduce_45(val, _values, result)
            @options_stack << result = { val[0] => true, val[2] => false, val[3] => false }
          
    result
end

def _reduce_46(val, _values, result)
            @options_stack << result = { val[0] => true, val[1] => true, val[3] => false }
          
    result
end

def _reduce_47(val, _values, result)
            @options_stack << result = { val[0] => true, val[1] => true, val[2] => true }
          
    result
end

def _reduce_48(val, _values, result)
 result = :multiline 
    result
end

def _reduce_49(val, _values, result)
 result = :ignorecase 
    result
end

def _reduce_50(val, _values, result)
 result = :extended 
    result
end

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
end   # module Reginald

require 'reginald/tokenizer'
