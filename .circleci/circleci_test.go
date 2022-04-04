package main

import (
	"testing"

	"github.com/getoutreach/stencil/pkg/stenciltest"
)

func TestCircleCI(t *testing.T) {
	st := stenciltest.New(t, "config.yml.tpl")
	st.Run(false)
}
