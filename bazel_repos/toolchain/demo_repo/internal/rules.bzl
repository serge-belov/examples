""" An example from https://belov.nz/posts/bazel-rules-TODO/ """

load(
    ":toolchains.bzl",
    "DEMO_TOOLCHAIN_TYPE",
)

def _demo_rule_impl(ctx):
    toolchain = ctx.toolchains[DEMO_TOOLCHAIN_TYPE]
    ctx.actions.write(
        output = ctx.outputs.out,
        content = "{}\n".format(toolchain.message),
    )

demo_rule = rule(
    implementation = _demo_rule_impl,
    attrs = {
        "out": attr.output(mandatory = True),
    },
    toolchains = [DEMO_TOOLCHAIN_TYPE],
)
