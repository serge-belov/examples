""" An example from https://belov.nz/posts/bazel-rules-hello/ """

def _demo_rule_impl(ctx):
    print("Hello, World!") # buildifier: disable=print

demo_rule = rule(
    implementation = _demo_rule_impl,
)
