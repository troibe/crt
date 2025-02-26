# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@crt//rules:repo.bzl", "http_archive_or_local")

def lowrisc_rv32imcb_repos(local = None, host_arch = "x86_64"):
    sha256_by_arch = {
        "x86_64": "e8cb05d8050773330c61a254f2a6b0fce75da4d4a8951d15570b18429fd21a98",
        "aarch64": "1b5df51abe85fb6d3cad24c62082046ab02788ef15e491040b680fcaa35a29ec",
    }
    http_archive_or_local(
        name = "lowrisc_rv32imcb_{}_files".format(host_arch),
        local = local,
        url = "https://github.com/troibe/lowrisc-toolchains/releases/download/20250225-1/lowrisc-toolchain-rv32imcb-{}-20250225-1.tar.xz".format(host_arch),
        sha256 = sha256_by_arch[host_arch],
        strip_prefix = "lowrisc-toolchain-rv32imcb-{}-20250225-1".format(host_arch),
        build_file = Label("//toolchains:BUILD.export_all.bazel"),
    )
