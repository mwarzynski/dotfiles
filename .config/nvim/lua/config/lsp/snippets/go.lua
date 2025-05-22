local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	-- If error not nil (your existing one, slightly enhanced)
	s(
		"iferr",
		fmt(
			[[
if err != nil {{
    return {}, fmt.Errorf("{}: %w", err)
}}
]],
			{ i(2, "nil"), i(1, "error message") }
		)
	),

	-- Function definition
	s(
		"func",
		fmt(
			[[
func {}({}) ({}) {{
    {}
}}
]],
			{ i(1, "FunctionName"), i(2, "params"), i(3, "return_types"), i(0) }
		)
	),

	-- Struct definition
	s(
		"struct",
		fmt(
			[[
type {} struct {{
    {}
}}
]],
			{ i(1, "StructName"), i(0) }
		)
	),

	-- For range loop
	s(
		"forr",
		fmt(
			[[
for {}, {} := range {} {{
    {}
}}
]],
			{ i(1, "index"), i(2, "value"), i(3, "collection"), i(0) }
		)
	),

	-- Goroutine
	s(
		"go",
		fmt(
			[[go func() {{{}
}}()
]],
			{ i(0) }
		)
	),

	-- Unit Tests
	s(
		"test",
		fmt(
			[[
import "testing"

func Test{}(t *testing.T) {{ // Placeholder 1 (uses arg 1 -> i(1))
    tests := []struct {{
        name    string
        args    interface{{}} // Define your args struct
        want    interface{{}} // Define your want struct
        wantErr bool
    }}{{
        // TODO: Add test cases.
        {{
            name: "{}_case_1", // Placeholder 2 (uses arg 2 -> i(2))
            args: nil,         // Example: i(3, "args_value") if you want a placeholder here
            want: nil,         // Example: i(4, "want_value") if you want a placeholder here
            wantErr: false,
        }},
    }}
    for _, tt := range tests {{
        t.Run(tt.name, func(t *testing.T) {{
            got, err := {}(tt.args) // Placeholder 3 (uses arg 1 -> i(1) by reference)
            if (err != nil) != tt.wantErr {{
                t.Errorf("{}() error = %v, wantErr %v", err, tt.wantErr) // Placeholder 4 (uses arg 1 -> i(1) by reference)
                return
            }}
            // Ensure comparison is valid, reflect.DeepEqual is often needed for non-primitive types.
            if got != tt.want {{ // Placeholder 5 (uses arg 1 -> i(1) by reference)
                t.Errorf("{}() = %v, want %v", got, tt.want)
            }}
        }})
    }}
}}
]],
			{
				i(1, "FunctionName"), -- Arg 1, for placeholder 1 (FunctionName)
				i(2, "example_test_name"), -- Arg 2, for placeholder 2 (prefix for the auto-generated test case name)
				i(1), -- For placeholder 3, referring to the node at index 1 of this arg table
				i(1), -- For placeholder 4, referring to the node at index 1 of this arg table
				i(1), -- For placeholder 5, referring to the node at index 1 of this arg table
			}
		)
	),
}
