""" An example from https://belov.nz/posts/bazel-rules-executable/ """

def _demo_binary_impl(ctx):
    out = ctx.actions.declare_file("hello")
    ctx.actions.write(
        output = out,
        content = "#!/bin/sh\necho \"Hello, World!\"\n",
    )
    return [DefaultInfo(
        files = depset([out]),
        executable = out,
    )]

demo_binary = rule(
    implementation = _demo_binary_impl,
    executable = True,
)
