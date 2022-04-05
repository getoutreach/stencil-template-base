// TODO(jaredallard): Make static.
package main

import (
	"testing"

	"github.com/getoutreach/stencil/pkg/stenciltest"
)

func TestGoMod(t *testing.T) {
	st := stenciltest.New(t, "go.mod.tpl")
	st.Run(false)
}

func TestMainTest(t *testing.T) {
	st := stenciltest.New(t, "main_test.go.tpl")
	st.Run(false)
}
