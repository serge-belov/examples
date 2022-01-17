""" An example from https://belov.nz/posts/bazel-rules-TODO/ """

def _demo_rule_impl(ctx):
    ctx.actions.write(
        output = ctx.outputs.out,
        content = "Hello, World!\n",
    )

demo_rule = rule(
    implementation = _demo_rule_impl,
    attrs = {
        "out": attr.output(mandatory = True),
    },
)
