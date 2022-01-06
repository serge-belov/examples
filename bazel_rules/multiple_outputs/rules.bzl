""" An example from https://belov.nz/posts/bazel-rules-multiple-outputs/ """

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

_demo_binary = rule(
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

def _demo_sha256_impl(ctx):
    ctx.actions.run_shell(
        inputs = ctx.files.src,
        outputs = [ctx.outputs.out],
        command = "sha256sum {s} > {o}".format(
            s = ctx.file.src.path,
            o = ctx.outputs.out.path,
        ),
    )

_demo_sha256 = rule(
    implementation = _demo_sha256_impl,
    attrs = {
        "out": attr.output(mandatory = True),
        "src": attr.label(
            mandatory = True,
            allow_single_file = True,
        ),
    },
)

def demo_outputs(name, srcs, out = None, **kwargs):
    out = "{}.sh".format(name) if out == None else out
    _demo_binary(
        name = "{}.script".format(name),
        srcs = srcs,
        out = out,
        **kwargs
    )
    _demo_sha256(
        name = name,
        out = "{}.sha256".format(out),
        src = out,
        **kwargs
    )
