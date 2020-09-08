# frozen_string_literal: true

# used by the reader and parser
# acts as the interface between them
# new readers should conform to this format
ParsedLine = Struct.new(:path, :ip)
