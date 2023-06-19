package e2e

import (
	"regexp"
	"testing"

	test_helper "github.com/Azure/terraform-module-test-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestExamplesBasic(t *testing.T) {
	test_helper.RunE2ETest(t, "../../", "examples/basic", terraform.Options{
		Upgrade: true,
	}, func(t *testing.T, output test_helper.TerraformOutput) {
		publicIp, ok := output["public_ip"].(string)
		assert.True(t, ok)
		assert.Regexp(t, regexp.MustCompile(`((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)\.?\b){4}`), publicIp)
	})
}
