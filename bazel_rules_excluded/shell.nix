{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShellNoCC {
    nativeBuildInputs = with pkgs;[
      bazel_4
      jdk11_headless
    ];
}
