""" An example from https://belov.nz/posts/bazel-rules-TODO/ """

def _demo_rule_impl(ctx):
    out = ctx.actions.declare_file("hello.txt")
    ctx.actions.write(
        output = out,
        content = "Hello, World!\n",
    )
    return [DefaultInfo(files = depset([out]))]

demo_rule = rule(
    implementation = _demo_rule_impl,
)
