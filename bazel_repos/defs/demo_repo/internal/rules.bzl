""" An example from https://belov.nz/posts/bazel-rules-decoupling-rules-interface/ """

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
