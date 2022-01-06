""" An example from https://belov.nz/posts/bazel-rules-source/ """

def _demo_binary_impl(ctx):
    out = ctx.outputs.out
    ctx.actions.expand_template(
        output = out,
        template = ctx.file.src,
        substitutions = {
            "{MESSAGE}": ctx.attr.message,
        },
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
        "out": attr.output(mandatory = True),
        "src": attr.label(
            mandatory = True,
            allow_single_file = [".tpl"],
        ),
    },
)
