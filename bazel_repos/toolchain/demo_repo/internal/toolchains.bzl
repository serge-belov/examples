""" An example from https://belov.nz/posts/bazel-rules-TODO/ """

DEMO_TOOLCHAIN_TYPE = "@demo_repo//:demo_toolchain_type"

def _demo_toolchain_info(ctx):
    return [
        platform_common.ToolchainInfo(
            message = ctx.attr.message,
        ),
    ]

demo_toolchain_info = rule(
    _demo_toolchain_info,
    attrs = {
        "message": attr.string(),
    },
)

def register_demo_toolchains(name = ""):
    native.register_toolchains(
        "@demo_repo//internal:demo_toolchain_english",
    )
