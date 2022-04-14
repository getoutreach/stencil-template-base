// TODO(jaredallard): Make static.
package main

import (
	"testing"

	"github.com/getoutreach/stencil/pkg/stenciltest"
)

func TestGoMod(t *testing.T) {
	st := stenciltest.New(t, "go.mod.tpl")
	st.Args(map[string]interface{}{"org": "getoutreach"})
	st.Run(false)
}
