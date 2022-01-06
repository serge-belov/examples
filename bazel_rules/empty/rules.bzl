""" An example from https://belov.nz/posts/bazel-rules-hello/ """

def _demo_rule_impl(ctx):
    pass

demo_rule = rule(
    implementation = _demo_rule_impl,
)
