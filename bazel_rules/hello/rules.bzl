def _demo_rule_impl(ctx):
    print("Hello, World!")

demo_rule = rule(
    implementation = _demo_rule_impl,
)
