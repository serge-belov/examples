_SCRIPT = "echo '#!/bin/sh' > {out} && cat {srcs} >> {out}"

def _demo_binary_impl(ctx):
    out = ctx.outputs.out
    cmd = _SCRIPT.format(
        srcs = " ".join([p.path for p in ctx.files.srcs]),
        out = out.path,
    )
    ctx.actions.run_shell(
        inputs = ctx.files.srcs,
        outputs = [out],
        command = cmd,
    )
    return [DefaultInfo(
        files = depset([out]),
        executable = out,
    )]

demo_binary = rule(
    implementation = _demo_binary_impl,
    executable = True,
    attrs = {
        "out": attr.output(mandatory = True),
        "srcs": attr.label_list(
            mandatory = True,
            allow_files = [".sh"],
        ),
    },
)
