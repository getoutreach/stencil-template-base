package main

import (
	"testing"

	"github.com/getoutreach/stencil/pkg/stenciltest"
)

func TestMainTest(t *testing.T) {
	st := stenciltest.New(t, "main_test.go.tpl")
	st.Run(false)
}
