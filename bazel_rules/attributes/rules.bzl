""" An example from https://belov.nz/posts/bazel-rules-attributes/ """

_TEMPLATE = """\
#!/bin/sh
echo "{}"
"""

def _demo_binary_impl(ctx):
    out = ctx.actions.declare_file("hello")
    ctx.actions.write(
        output = out,
        content = _TEMPLATE.format(ctx.attr.message),
    )
    return [DefaultInfo(
        files = depset([out]),
        executable = out,
    )]

demo_binary = rule(
    implementation = _demo_binary_impl,
    executable = True,
    attrs = {
        "message": attr.string(mandatory = True),
    },
)
