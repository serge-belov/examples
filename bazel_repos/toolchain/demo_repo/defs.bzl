""" Public definitions for demo_repo """

load(
    "//internal:rules.bzl",
    _demo_rule = "demo_rule",
)
load(
    "//internal:toolchains.bzl",
    _register_demo_toolchains = "register_demo_toolchains",
)

demo_rule = _demo_rule
register_demo_toolchains = _register_demo_toolchains
