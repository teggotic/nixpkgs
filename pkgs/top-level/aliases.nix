lib: self: super:

### Deprecated aliases - for backward compatibility
### Please maintain this list in ASCIIbetical ordering.
### Hint: the "sections" are delimited by ### <letter> ###

# These aliases should not be used within nixpkgs, but exist to improve
# backward compatibility in projects outside of nixpkgs. See the
# documentation for the `allowAliases` option for more background.

# A script to convert old aliases to throws and remove old
# throws can be found in './maintainers/scripts/remove-old-aliases.py'.

# Add 'preserve, reason: reason why' after the date if the alias should not be removed.
# Try to keep them to a minimum.
# valid examples of what to preserve:
#   distro aliases such as:
#     debian-package-name -> nixos-package-name

with self;

let
  # Removing recurseForDerivation prevents derivations of aliased attribute set
  # to appear while listing all the packages available.
  removeRecurseForDerivations = alias: with lib;
    if alias.recurseForDerivations or false
    then removeAttrs alias ["recurseForDerivations"]
    else alias;

  # Disabling distribution prevents top-level aliases for non-recursed package
  # sets from building on Hydra.
  removeDistribute = alias: with lib;
    if isDerivation alias then
      dontDistribute alias
    else alias;

  # Make sure that we are not shadowing something from all-packages.nix.
  checkInPkgs = n: alias:
    if builtins.hasAttr n super
    then throw "Alias ${n} is still in all-packages.nix"
    else alias;

  mapAliases = aliases:
    lib.mapAttrs (n: alias:
      removeDistribute
        (removeRecurseForDerivations
          (checkInPkgs n alias)))
      aliases;
in

mapAliases ({
  # Added 2018-07-16 preserve, reason: forceSystem should not be used directly in Nixpkgs.
  forceSystem = system: _:
    (import self.path { localSystem = { inherit system; }; });

  _0x0 = throw "0x0 upstream is abandoned and no longer exists: https://gitlab.com/somasis/scripts/";

  ### A ###

  accounts-qt = throw "'accounts-qt' has been renamed to/replaced by 'libsForQt5.accounts-qt'"; # Converted to throw 2022-02-22
  acoustidFingerprinter = throw "acoustidFingerprinter has been removed from nixpkgs, as it was unmaintained"; # Added 2022-05-09
  adobeReader = throw "'adobeReader' has been renamed to/replaced by 'adobe-reader'"; # Converted to throw 2022-02-22
  adobe_flex_sdk = throw "'adobe_flex_sdk' has been renamed to/replaced by 'apache-flex-sdk'"; # Converted to throw 2022-02-22
  adoptopenjdk-hotspot-bin-17 = throw "AdoptOpenJDK is now Temurin. Use temurin-bin-17"; # added 2022-07-02
  adoptopenjdk-jre-hotspot-bin-17 = throw "AdoptOpenJDK is now Temurin and JRE is no longer provided. Use temurin-bin-17"; # added 2022-07-02
  aesop = throw "aesop has been removed from nixpkgs, as it was unmaintained"; # Added 2021-08-05
  ag = throw "'ag' has been renamed to/replaced by 'silver-searcher'"; # Converted to throw 2022-02-22
  aircrackng = throw "'aircrackng' has been renamed to/replaced by 'aircrack-ng'"; # Converted to throw 2022-02-22
  airfield = throw "airfield has been removed due to being unmaintained"; # Added 2023-05-19
  airtame = throw "airtame has been removed due to being unmaintained"; # Added 2022-01-19
  alertmanager-bot = throw "alertmanager-bot is broken and has been archived by upstream" ; # Added 2023-07-28
  aleth = throw "aleth (previously packaged as cpp_ethereum) has been removed; abandoned upstream"; # Added 2020-11-30
  aliza = throw "aliza has been removed, because it depended on qt4 and was unmaintained in nixpkgs"; # Added 2022-05-12
  alsaLib = alsa-lib; # Added 2021-06-09
  alsaOss = alsa-oss; # Added 2021-06-10
  alsaPluginWrapper = alsa-plugins-wrapper; # Added 2021-06-10
  alsaPlugins = alsa-plugins; # Added 2021-06-10
  alsaTools = alsa-tools; # Added 2021-06-10
  alsaUtils = alsa-utils; # Added 2021-06-10
  amazon-glacier-cmd-interface = throw "amazon-glacier-cmd-interface has been removed due to it being unmaintained"; # Added 2020-10-30
  aminal = throw "aminal was renamed to darktile"; # Added 2021-09-28
  ammonite-repl = throw "'ammonite-repl' has been renamed to/replaced by 'ammonite'"; # Converted to throw 2022-02-22
  amuleDaemon = throw "amuleDaemon was renamed to amule-daemon"; # Added 2022-02-11
  amsn = throw "amsn has been removed due to being unmaintained"; # Added 2020-12-09
  amuleGui = throw "amuleGui was renamed to amule-gui"; # Added 2022-02-11
  angelfish = libsForQt5.kdeGear.angelfish; # Added 2021-10-06
  ansible_2_10 = throw "Ansible 2.10 went end of life in 2022/05 and has subsequently been dropped"; # Added 2022-03-30
  ansible_2_11 = throw "Ansible 2.11 goes end of life in 2022/11 and can't be supported throughout the 22.05 release cycle"; # Added 2022-03-30
  ansible_2_12 = throw "Ansible 2.12 goes end of life in 2023/05 and can't be supported throughout the 23.05 release cycle"; # Added 2023-05-16
  ansible_2_9 = throw "Ansible 2.9 went end of life in 2022/05 and has subsequently been dropped"; # Added 2022-03-30
  animbar = throw "animbar has been removed, because it was unmaintained"; # Added 2022-05-26
  antimicro = throw "antimicro has been removed as it was broken, see antimicrox instead"; # Added 2020-08-06
  antimicroX = antimicrox; # Added 2021-10-31
  apple-music-electron = throw "'apple-music-electron' is end of life and has been removed, you can use 'cider' instead"; # Added 2022-10-02
  appleseed = throw "appleseed has been removed, because it was unmaintained"; # Added 2022-05-26
  arangodb_3_3 = throw "arangodb_3_3 went end of life and has been removed"; # Added 2022-10-08
  arangodb_3_4 = throw "arangodb_3_4 went end of life and has been removed"; # Added 2022-10-08
  arangodb_3_5 = throw "arangodb_3_5 went end of life and has been removed"; # Added 2022-10-08
  ardour_5 = throw "ardour_5 has been removed. see https://github.com/NixOS/nixpkgs/issues/139549"; # Added 2021-09-28
  arduino_core = throw "'arduino_core' has been renamed to/replaced by 'arduino-core'"; # Converted to throw 2022-02-22
  arora = throw "arora has been removed"; # Added 2020-09-09
  asciidocFull = throw "'asciidocFull' has been renamed to/replaced by 'asciidoc-full'"; # Converted to throw 2022-02-22
  aseprite-unfree = aseprite; # Added 2023-08-26
  asls = throw "asls has been removed: abandoned by upstream"; # Added 2023-03-16
  asterisk_13 = throw "asterisk_13: Asterisk 13 is end of life and has been removed"; # Added 2022-04-06
  asterisk_15 = throw "asterisk_15: Asterisk 15 is end of life and has been removed"; # Added 2020-10-07
  asterisk_16 = throw "asterisk_16: Asterisk 16 is end of life and has been removed"; # Added 2023-04-19
  asterisk_17 = throw "asterisk_17: Asterisk 17 is end of life and has been removed"; # Added 2022-04-06
  asterisk_19 = throw "asterisk_19: Asterisk 19 is end of life and has been removed"; # Added 2023-04-19
  at_spi2_atk = throw "'at_spi2_atk' has been renamed to/replaced by 'at-spi2-atk'"; # Converted to throw 2022-02-22
  at_spi2_core = throw "'at_spi2_core' has been renamed to/replaced by 'at-spi2-core'"; # Converted to throw 2022-02-22
  aucdtect = throw "aucdtect: Upstream no longer provides download urls"; # Added 2020-12-26
  audacity-gtk2 = throw "'audacity-gtk2' has been removed to/replaced by 'audacity'"; # Added 2022-10-09
  audacity-gtk3 = throw "'audacity-gtk3' has been removed to/replaced by 'audacity'"; # Added 2022-10-09
  automoc4 = throw "automoc4 has been removed from nixpkgs"; # Added 2022-05-30
  avldrums-lv2 = x42-avldrums; # Added 2020-03-29
  avogadro = throw "avogadro has been removed, because it depended on qt4"; # Added 2022-06-12
  avxsynth = throw "avxsynth was removed because it was broken"; # Added 2021-05-18
  awesome-4-0 = awesome; # Added 2022-05-05
  aws = throw "aws has been removed: abandoned by upstream. For the AWS CLI maintained by Amazon, see 'awscli' or 'awscli2'"; # Added 2022-09-21
  awless = throw "awless has been dropped due to the lack of maintenance from upstream since 2018"; # Added 2022-05-30
  aws-okta = throw "aws-okta is on indefinite hiatus. See https://github.com/segmentio/aws-okta/issues/278"; # Added 2022-04-05;
  axoloti = throw "axoloti has been removed: abandoned by upstream"; # Added 2022-05-13
  azure-vhd-utils = throw "azure-vhd-utils has been dropped due to the lack of maintenance from upstream since 2018"; # Added 2022-06-03
  azureus = throw "azureus is now known as vuze and the version in nixpkgs was really outdated"; # Added 2021-08-02

  ### B ###

  badtouch = authoscope; # Project was renamed, added 20210626
  baget = throw "'baget' has been removed due to being unmaintained";
  bar-xft = throw "'bar-xft' has been renamed to/replaced by 'lemonbar-xft'"; # Converted to throw 2022-02-22
  bashCompletion = throw "'bashCompletion' has been renamed to/replaced by 'bash-completion'"; # Converted to throw 2022-02-22
  bashInteractive_5 = bashInteractive; # Added 2021-08-20
  bash_5 = bash; # Added 2021-08-20
  bashburn = throw "bashburn has been removed: deleted by upstream"; # Added 2022-01-07
  bazaar = throw "bazaar has been deprecated by breezy"; # Added 2020-04-19
  bazaarTools = throw "bazaar has been deprecated by breezy"; # Added 2020-04-19
  bazel_0 = throw "bazel 0 is past end of life as it is not an lts version"; # Added 2022-05-09
  bazel_0_27 = throw "bazel 0.27 is past end of life as it is not an lts version"; # Added 2022-05-09
  bazel_0_29 = throw "bazel 0.29 is past end of life as it is not an lts version"; # Added 2022-05-09
  bazel_1 = throw "bazel 1 is past end of life as it is not an lts version"; # Added 2022-05-09
  bazel_3 = throw "bazel 3 is past end of life as it is not an lts version"; # Added 2023-02-02
  bcat = throw "bcat has been removed because upstream is dead"; # Added 2021-08-22
  bedup = throw "bedup was removed because it was broken and abandoned upstream"; # added 2023-02-04
  beetsExternalPlugins = throw "beetsExternalPlugins has been deprecated, use beetsPackages.$pluginname"; # Added 2022-05-07
  beret = throw "beret has been removed"; # Added 2021-11-16
  bin_replace_string = throw "bin_replace_string has been removed: deleted by upstream"; # Added 2022-01-07
  bird2 = bird; # Added 2022-02-21
  bird6 = throw "bird6 was dropped. Use bird instead, which has support for both ipv4/ipv6"; # Added 2022-02-21
  bitbucket-cli = throw "bitbucket-cli has been removed: abandoned by upstream"; # Added 2022-03-21
  bitcoin-classic = throw "bitcoin-classic has been removed: the Bitcoin Classic project has closed down, https://bitcoinclassic.com/news/closing.html"; # Added 2022-11-24
  bitcoind-classic = throw "bitcoind-classic has been removed: the Bitcoin Classic project has closed down, https://bitcoinclassic.com/news/closing.html"; # Added 2022-11-24
  bitcoin-gold = throw "bitcoin-gold has been removed since it's unnmaintained and will stop building with Qt > 5.14"; # Added 2022-11-24
  bitcoind-gold = throw "bitcoin-gold has been removed since it's unnmaintained: https://github.com/BTCGPU/BTCGPU/graphs/code-frequency"; # Added 2022-11-24
  ddclient = throw "ddclient has been removed on the request of the upstream maintainer because it is unmaintained and has bugs. Please switch to a different software like `inadyn` or `knsupdate`."; # Added 2023-07-04
  digibyte = throw "digibyte has been removed since it's unnmaintained and will stop building with Qt > 5.14"; # Added 2022-11-24
  digibyted = throw "digibyted has been removed since it's unnmaintained: https://github.com/digibyte/digibyte/graphs/code-frequency"; # Added 2022-11-24
  bitsnbots = throw "bitsnbots has been removed because it was broken and upstream missing"; # Added 2021-08-22
  blastem = throw "blastem has been removed from nixpkgs as it would still require python2"; # Added 2022-01-01
  bluezFull = throw "'bluezFull' has been renamed to/replaced by 'bluez'"; # Converted to throw 2023-09-10
  bomi = throw "bomi has been removed from nixpkgs since it was broken and abandoned upstream"; # Added 2020-12-10
  boost159 = throw "boost159 has been deprecated in favor of the latest version"; # Added 2023-01-01
  boost15x = throw "boost15x has been deprecated in favor of the latest version"; # Added 2023-01-01
  boost160 = throw "boost160 has been deprecated in favor of the latest version"; # Added 2023-01-01
  boost168 = throw "boost168 has been deprecated in favor of the latest version"; # Added 2023-06-08
  boost169 = throw "boost169 has been deprecated in favor of the latest version"; # Added 2023-06-08
  boost16x = throw "boost16x has been deprecated in favor of the latest version"; # Added 2023-06-08
  boost170 = throw "boost170 has been deprecated in favor of the latest version"; # Added 2023-06-08
  boost172 = throw "boost172 has been deprecated in favor of the latest version"; # Added 2023-06-08
  boost173 = throw "boost173 has been deprecated in favor of the latest version"; # Added 2023-06-08
  boost174 = throw "boost174 has been deprecated in favor of the latest version"; # Added 2023-06-08
  boost17x = throw "boost17x has been deprecated in favor of the latest version"; # Added 2023-07-13
  boost18x = throw "boost18x has been deprecated in favor of the latest version"; # Added 2023-07-13
  botan = throw "botan has been removed because it did not support a supported openssl version"; # added 2021-12-15
  bpftool = bpftools; # Added 2021-05-03
  bpytop = throw "bpytop has been deprecated by btop"; # Added 2023-02-16
  brackets = throw "brackets has been removed, it was unmaintained and had open vulnerabilities"; # Added 2021-01-24
  bridge_utils = throw "'bridge_utils' has been renamed to/replaced by 'bridge-utils'"; # Converted to throw 2022-02-22
  bro = throw "'bro' has been renamed to/replaced by 'zeek'"; # Converted to throw 2023-09-10
  btops = throw "btops has been dropped due to the lack of maintenance from upstream since 2017"; # Added 2022-06-02
  btrfsProgs = throw "'btrfsProgs' has been renamed to/replaced by 'btrfs-progs'"; # Converted to throw 2022-02-22
  bud = throw "bud has been removed: abandoned by upstream"; # Added 2022-03-14
  inherit (libsForQt5.mauiPackages) buho; # added 2022-05-17
  bukut = throw "bukut has been removed since it has been archived by upstream"; # Added 2023-05-24
  buttersink = throw "buttersink has been removed: abandoned by upstream"; # Added 2022-04-05
  # Shorter names; keep the longer name for back-compat. Added 2023-04-11
  buildFHSUserEnv = buildFHSEnv;
  buildFHSUserEnvChroot = buildFHSEnvChroot;
  buildFHSUserEnvBubblewrap = buildFHSEnvBubblewrap;

  # bitwarden_rs renamed to vaultwarden with release 1.21.0 (2021-04-30)
  bitwarden_rs = vaultwarden;
  bitwarden_rs-mysql = vaultwarden-mysql;
  bitwarden_rs-postgresql = vaultwarden-postgresql;
  bitwarden_rs-sqlite = vaultwarden-sqlite;
  bitwarden_rs-vault = vaultwarden-vault;


  bs1770gain = throw "bs1770gain has been removed from nixpkgs, as it had no maintainer or reverse dependencies"; # Added 2021-01-02
  bsod = throw "bsod has been removed: deleted by upstream"; # Added 2022-01-07
  btc1 = throw "btc1 has been removed, it was abandoned by upstream"; # Added 2020-11-03
  buildPerlPackage = throw "'buildPerlPackage' has been renamed to/replaced by 'perlPackages.buildPerlPackage'"; # Converted to throw 2022-02-22
  buildkite-agent3 = throw "'buildkite-agent3' has been renamed to/replaced by 'buildkite-agent'"; # Converted to throw 2022-02-22
  bundler_HEAD = throw "'bundler_HEAD' has been renamed to/replaced by 'bundler'"; # Converted to throw 2022-02-22
  bunny = throw "bunny has been removed: deleted by upstream"; # Added 2022-01-07
  bypass403 = throw "bypass403 has been removed: deleted by upstream"; # Added 2022-01-07

  ### C ###

  c14 = throw "c14 is deprecated and archived by upstream"; # Added 2022-04-10
  caddy1 = throw "caddy 1.x has been removed from nixpkgs, as it's unmaintained: https://github.com/caddyserver/caddy/blob/master/.github/SECURITY.md#supported-versions"; # Added 2020-10-02
  caffe2 = throw "caffe2 has been removed: subsumed under the PyTorch project"; # Added 2022-04-25
  calibre-py2 = throw "calibre-py2 has been removed from nixpkgs, as calibre has upgraded to python 3. Please use calibre as replacement"; # Added 2021-01-13
  calibre-py3 = throw "calibre-py3 has been removed from nixpkgs, as calibre's default python version is now 3. Please use calibre as replacement"; # Added 2021-01-13
  callPackage_i686 = pkgsi686Linux.callPackage;
  cantarell_fonts = throw "'cantarell_fonts' has been renamed to/replaced by 'cantarell-fonts'"; # Converted to throw 2022-02-22
  cask = emacs.pkgs.cask; # Added 2022-11-12
  cargo-download = throw "cargo-download has been removed from nixpkgs as it is unmaintained, use cargo-clone instead"; # Added 2022-10-11
  cargo-embed = throw "cargo-embed is now part of the probe-rs package"; # Added 2023-07-03
  cargo-flash = throw "cargo-flash is now part of the probe-rs package"; # Added 2023-07-03
  cargo-tree = throw "cargo-tree has been removed, use the builtin `cargo tree` command instead"; # Added 2020-08-20
  carnix = throw "carnix has been removed, use alternatives such as naersk and crate2nix instead"; # Added 2022-11-22
  casperjs = throw "casperjs has been removed, it was abandoned by upstream and broken";
  cassandra_2_1 = throw "cassandra_2_1 has been removed, please use cassandra_3_11 instead"; # Added 2022-10-29
  cassandra_2_2 = throw "cassandra_2_2 has been removed, please use cassandra_3_11 instead"; # Added 2022-10-29
  catfish = throw "'catfish' has been renamed to/replaced by 'xfce.catfish'"; # Converted to throw 2023-09-10
  cawbird = throw "cawbird has been abandoned upstream and is broken anyways due to Twitter closing its API";
  ccloud-cli = throw "ccloud-cli has been removed, please use confluent-cli instead"; # Added 2023-06-09
  ccnet = throw "ccnet has been removed because seafile does not depend on it anymore"; # Added 2021-03-25
  cde-gtk-theme = throw "cde-gtk-theme has been removed from nixpkgs as it shipped with python2 scripts that didn't work anymore"; # Added 2022-01-12
  cgmanager = throw "cgmanager was deprecated by lxc and therefore removed from nixpkgs"; # Added 2020-06-05
  checkbashism = throw "'checkbashism' has been renamed to/replaced by 'checkbashisms'"; # Converted to throw 2022-02-22
  chefdk = throw "chefdk has been removed due to being deprecated upstream by Chef Workstation"; # Added 2023-03-22
  chocolateDoom = chocolate-doom; # Added 2023-05-01
  chrome-gnome-shell = gnome-browser-connector; # Added 2022-07-27
  chronos = throw "chronos has been removed from nixpkgs, as it was unmaintained"; # Added 2020-08-15
  chunkwm = throw "chunkwm has been removed: abandoned by upstream"; # Added 2022-01-07
  cifs_utils = throw "'cifs_utils' has been renamed to/replaced by 'cifs-utils'"; # Converted to throw 2022-02-22
  cipherscan = throw "cipherscan was removed from nixpkgs, as it was unmaintained"; # added 2021-12-11
  citra = citra-nightly; # added 2022-05-17
  ckb = throw "'ckb' has been renamed to/replaced by 'ckb-next'"; # Converted to throw 2022-02-22
  clickshare-csc1 = throw "'clickshare-csc1' has been removed as it requires qt4 which is being removed"; # Added 2022-06-16
  inherit (libsForQt5.mauiPackages) clip; # added 2022-05-17
  cpp-ipfs-api = cpp-ipfs-http-client; # Project has been renamed. Added 2022-05-15
  cratesIO = throw "cratesIO has been removed, use alternatives such as naersk and crate2nix instead"; # Added 2022-11-22
  creddump = throw "creddump has been removed from nixpkgs as the upstream has abandoned the project"; # Added 2022-01-01
  crispyDoom = crispy-doom; # Added 2023-05-01

  # these are for convenience, not for backward compat and shouldn't expire
  clang5Stdenv = lowPrio llvmPackages_5.stdenv;
  clang6Stdenv = lowPrio llvmPackages_6.stdenv;
  clang7Stdenv = lowPrio llvmPackages_7.stdenv;
  clang8Stdenv = lowPrio llvmPackages_8.stdenv;
  clang9Stdenv = lowPrio llvmPackages_9.stdenv;
  clang10Stdenv = lowPrio llvmPackages_10.stdenv;
  clang11Stdenv = lowPrio llvmPackages_11.stdenv;
  clang12Stdenv = lowPrio llvmPackages_12.stdenv;
  clang13Stdenv = lowPrio llvmPackages_13.stdenv;
  clang14Stdenv = lowPrio llvmPackages_14.stdenv;
  clang15Stdenv = lowPrio llvmPackages_15.stdenv;
  clang16Stdenv = lowPrio llvmPackages_16.stdenv;

  clangAnalyzer = throw "'clangAnalyzer' has been renamed to/replaced by 'clang-analyzer'"; # Converted to throw 2022-02-22
  clasp = clingo; # added 2022-12-22
  claws-mail-gtk2 = throw "claws-mail-gtk2 was removed to get rid of Python 2, please use claws-mail"; # Added 2021-12-05
  claws-mail-gtk3 = claws-mail; # Added 2021-07-10
  clawsMail = throw "'clawsMail' has been renamed to/replaced by 'claws-mail'"; # Converted to throw 2022-02-22
  cldr-emoji-annotation = throw "'cldr-emoji-annotation' has been removed, as it was unmaintained; use 'cldr-annotations' instead"; # Added 2022-04-03
  clearsilver = throw "clearsilver has been removed: abandoned by upstream"; # Added 2022-03-15
  clementineUnfree = throw "clementineUnfree has been removed because Spotify stopped supporting libspotify"; # added 2022-05-29
  clutter_gtk = throw "'clutter_gtk' has been renamed to/replaced by 'clutter-gtk'"; # Converted to throw 2022-02-22
  cmakeWithQt4Gui = throw "cmakeWithQt4Gui has been removed in favor of cmakeWithGui (Qt 5)"; # Added 2021-05
  codimd = hedgedoc; # Added 2020-11-29
  inherit (libsForQt5.mauiPackages) communicator; # added 2022-05-17
  compton = throw "'compton' has been renamed to/replaced by 'picom'"; # Converted to throw 2023-09-10
  compton-git = throw "'compton-git' has been renamed to/replaced by 'compton'"; # Converted to throw 2022-02-22
  concurrencykit = libck; # Added 2021-03
  conntrack_tools = throw "'conntrack_tools' has been renamed to/replaced by 'conntrack-tools'"; # Converted to throw 2022-02-22
  container-linux-config-transpiler = throw "container-linux-config-transpiler is deprecated and archived by upstream"; # Added 2022-04-05
  cool-old-term = throw "'cool-old-term' has been renamed to/replaced by 'cool-retro-term'"; # Converted to throw 2022-02-22
  corsmisc = throw "corsmisc has been removed (upstream is gone)"; # Added 2022-01-24
  couchdb = throw "couchdb was removed from nixpkgs, use couchdb3 instead"; # Added 2021-03-03
  couchdb2 = throw "couchdb2 was removed from nixpkgs, use couchdb3 instead"; # Added 2021-03-03
  coreclr = throw "coreclr has been removed from nixpkgs, use dotnet-sdk instead"; # added 2022-06-12
  corgi = throw "corgi has been dropped due to the lack of maintenance from upstream since 2018"; # Added 2022-06-02
  cpp-gsl = throw "'cpp-gsl' has been renamed to/replaced by 'microsoft-gsl'"; # Converted to throw 2022-02-22
  cpp_ethereum = throw "cpp_ethereum has been removed; abandoned upstream"; # Added 2020-11-30
  cpuminer-multi = throw "cpuminer-multi has been removed: deleted by upstream"; # Added 2022-01-07
  crafty = throw "crafty has been removed: deleted by upstream"; # Added 2022-01-07
  cryptol = throw "cryptol was removed due to prolonged broken build"; # Added 2020-08-21
  cryptpad = throw "cryptpad has been removed, because it was unmaintained in nixpkgs"; # Added 2022-07-04
  ctl = throw "ctl has been removed: abandoned by upstream"; # Added 2022-05-13

  # CUDA Toolkit
  cudatoolkit_6 = throw "cudatoolkit_6 has been removed in favor of newer versions"; # Added 2021-02-14
  cudatoolkit_65 = throw "cudatoolkit_65 has been removed in favor of newer versions"; # Added 2021-02-14
  cudatoolkit_7 = throw "cudatoolkit_7 has been removed in favor of newer versions"; # Added 2021-02-14
  cudatoolkit_7_5 = throw "cudatoolkit_7_5 has been removed in favor of newer versions"; # Added 2021-02-14
  cudatoolkit_8 = throw "cudatoolkit_8 has been removed in favor of newer versions"; # Added 2021-02-14
  cudatoolkit_9 = throw "cudatoolkit_9 has been removed in favor of newer versions"; # Added 2021-04-18
  cudatoolkit_9_0 = throw "cudatoolkit_9_0 has been removed in favor of newer versions"; # Added 2021-04-18
  cudatoolkit_9_1 = throw "cudatoolkit_9_1 has been removed in favor of newer versions"; # Added 2021-04-18
  cudatoolkit_9_2 = throw "cudatoolkit_9_2 has been removed in favor of newer versions"; # Added 2021-04-18
  cudatoolkit_10 = throw "cudatoolkit_10 has been renamed to cudaPackages_10.cudatoolkit"; # Added 2022-04-04
  cudatoolkit_10_0 = throw "cudatoolkit_10_0 has been renamed to cudaPackages_10_0.cudatoolkit"; # Added 2022-04-04
  cudatoolkit_10_1 = throw "cudatoolkit_10_1 has been renamed to cudaPackages_10_1.cudatoolkit"; # Added 2022-04-04
  cudatoolkit_10_2 = throw "cudatoolkit_10_2 has been renamed to cudaPackages_10_2.cudatoolkit"; # Added 2022-04-04
  cudatoolkit_11_0 = throw "cudatoolkit_11_0 has been renamed to cudaPackages_11_0.cudatoolkit"; # Added 2022-04-04
  cudatoolkit_11_1 = throw "cudatoolkit_11_1 has been renamed to cudaPackages_11_1.cudatoolkit"; # Added 2022-04-04
  cudatoolkit_11_2 = throw "cudatoolkit_11_2 has been renamed to cudaPackages_11_2.cudatoolkit"; # Added 2022-04-04
  cudatoolkit_11_3 = throw "cudatoolkit_11_3 has been renamed to cudaPackages_11_3.cudatoolkit"; # Added 2022-04-04
  cudatoolkit_11_4 = throw "cudatoolkit_11_4 has been renamed to cudaPackages_11_4.cudatoolkit"; # Added 2022-04-04
  cudatoolkit_11_5 = throw "cudatoolkit_11_5 has been renamed to cudaPackages_11_5.cudatoolkit"; # Added 2022-04-04
  cudatoolkit_11_6 = throw "cudatoolkit_11_6 has been renamed to cudaPackages_11_6.cudatoolkit"; # Added 2022-04-04

  cudnn = throw "cudnn is now part of cudaPackages*"; # Added 2022-04-04
  cudnn6_cudatoolkit_8 = throw "cudnn6_cudatoolkit_8 has been removed in favor of newer versions"; # Added 2021-02-14
  cudnn_cudatoolkit_7 = throw "cudnn_cudatoolkit_7 has been removed in favor of newer versions"; # Added 2021-02-14
  cudnn_7_4_cudatoolkit_10_0 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_cudatoolkit_7_5 = throw "cudnn_cudatoolkit_7_5 has been removed in favor of newer versions"; # Added 2021-02-14
  cudnn_7_6_cudatoolkit_10_0 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_7_6_cudatoolkit_10_1 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_cudatoolkit_8 = throw "cudnn_cudatoolkit_8 has been removed in favor of newer versions"; # Added 2021-02-14
  cudnn_8_1_cudatoolkit_10_2 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_8_1_cudatoolkit_11_0 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_8_1_cudatoolkit_11_1 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_8_1_cudatoolkit_11_2 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_8_1_cudatoolkit_10 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_8_3_cudatoolkit_10_2 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_8_3_cudatoolkit_11_0 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_8_3_cudatoolkit_11_1 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_8_3_cudatoolkit_11_2 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_8_3_cudatoolkit_11_3 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_8_3_cudatoolkit_11_4 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_8_3_cudatoolkit_11_5 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_8_3_cudatoolkit_10 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_8_3_cudatoolkit_11 = throw "cudnn* is now part of cudaPackages*"; # Added 2022-04-04
  cudnn_cudatoolkit_9 = throw "cudnn_cudatoolkit_9 has been removed in favor of newer versions"; # Added 2021-04-18
  cudnn_cudatoolkit_9_0 = throw "cudnn_cudatoolkit_9_0 has been removed in favor of newer versions"; # Added 2021-04-18
  cudnn_cudatoolkit_9_1 = throw "cudnn_cudatoolkit_9_1 has been removed in favor of newer versions"; # Added 2021-04-18
  cudnn_cudatoolkit_9_2 = throw "cudnn_cudatoolkit_9_2 has been removed in favor of newer versions"; # Added 2021-04-18
  cura_stable = throw "cura_stable was removed because it was broken and used Python 2"; # added 2022-06-05
  curl_unix_socket = throw "curl_unix_socket has been dropped due to the lack of maintenance from upstream since 2015"; # Added 2022-06-02
  cutensor = throw "cutensor is now part of cudaPackages*"; # Added 2022-04-04
  cutensor_cudatoolkit_10 = throw "cutensor* is now part of cudaPackages*"; # Added 2022-04-04
  cutensor_cudatoolkit_10_1 = throw "cutensor* is now part of cudaPackages*"; # Added 2022-04-04
  cutensor_cudatoolkit_10_2 = throw "cutensor* is now part of cudaPackages*"; # Added 2022-04-04
  cutensor_cudatoolkit_11 = throw "cutensor* is now part of cudaPackages*"; # Added 2022-04-04
  cutensor_cudatoolkit_11_0 = throw "cutensor* is now part of cudaPackages*"; # Added 2022-04-04
  cutensor_cudatoolkit_11_1 = throw "cutensor* is now part of cudaPackages*"; # Added 2022-04-04
  cutensor_cudatoolkit_11_2 = throw "cutensor* is now part of cudaPackages*"; # Added 2022-04-04
  cutensor_cudatoolkit_11_3 = throw "cutensor* is now part of cudaPackages*"; # Added 2022-04-04
  cutensor_cudatoolkit_11_4 = throw "cutensor* is now part of cudaPackages*"; # Added 2022-04-04

  cloud-print-connector = throw "Google Cloudprint is officially discontinued since Jan 2021, more info https://support.google.com/chrome/a/answer/9633006";
  cquery = throw "cquery has been removed because it is abandoned by upstream. Consider switching to clangd or ccls instead"; # Added 2020-06-15
  cups-googlecloudprint = throw "Google Cloudprint is officially discontinued since Jan 2021, more info https://support.google.com/chrome/a/answer/9633006";
  cups-kyodialog3 = cups-kyodialog; # Added 2022-11-12
  cupsBjnp = throw "'cupsBjnp' has been renamed to/replaced by 'cups-bjnp'"; # Converted to throw 2022-02-22
  cups_filters = throw "'cups_filters' has been renamed to/replaced by 'cups-filters'"; # Converted to throw 2022-02-22
  curl-impersonate-bin = throw "'curl-impersonate-bin' has been replaced by 'curl-impersonate'"; # Added 2022-10-08
  curlcpp = throw "curlcpp has been removed, no active maintainers and no usage within nixpkgs"; # Added 2022-05-10
  curaByDagoma = throw "curaByDagoma has been removed from nixpkgs, because it was unmaintained and dependent on python2 packages"; # Added 2022-01-12
  curaLulzbot = throw "curaLulzbot has been removed due to insufficient upstream support for a modern dependency chain"; # Added 2021-10-23
  cv = throw "'cv' has been renamed to/replaced by 'progress'"; # Converted to throw 2022-02-22
  cvs_fast_export = cvs-fast-export; # Added 2021-06-10

  ### D ###

  oroborus = throw "oroborus was removed, because it was abandoned years ago."; #Added 2023-09-10
  d1x_rebirth = throw "'d1x_rebirth' has been renamed to/replaced by 'dxx-rebirth'"; # Converted to throw 2022-02-22
  d2x_rebirth = throw "'d2x_rebirth' has been renamed to/replaced by 'dxx-rebirth'"; # Converted to throw 2022-02-22
  dart_dev = throw "Non-stable versions of Dart have been removed"; # Added 2020-01-15
  dart_old = throw "Non-stable versions of Dart have been removed"; # Added 2020-01-15
  dart_stable = dart; # Added 2020-01-15
  dat = nodePackages.dat;
  dashpay = throw "'dashpay' has been removed because it was unmaintained"; # Added 2022-05-12
  dbus_daemon = throw "'dbus_daemon' has been renamed to/replaced by 'dbus.daemon'"; # Converted to throw 2022-02-22
  dbus_glib = throw "'dbus_glib' has been renamed to/replaced by 'dbus-glib'"; # Converted to throw 2022-02-22
  dbus_libs = throw "'dbus_libs' has been renamed to/replaced by 'dbus'"; # Converted to throw 2022-02-22
  dbus_tools = throw "'dbus_tools' has been renamed to/replaced by 'dbus.out'"; # Converted to throw 2022-02-22
  dbvisualizer = throw "dbvisualizer has been removed from nixpkgs, as it's unmaintained"; # Added 2020-09-20
  dd-agent = throw "dd-agent has been removed in favor of the newer datadog-agent"; # Added 2022-04-26
  ddar = throw "ddar has been removed: abandoned by upstream"; # Added 2022-03-18
  deadbeef-mpris2-plugin = throw "'deadbeef-mpris2-plugin' has been renamed to/replaced by 'deadbeefPlugins.mpris2'"; # Converted to throw 2022-02-22
  deadpixi-sam = deadpixi-sam-unstable;

  debian_devscripts = throw "'debian_devscripts' has been renamed to/replaced by 'debian-devscripts'"; # Converted to throw 2022-02-22
  debugedit-unstable = debugedit; # Added 2021-11-22
  deepspeech = throw "deepspeech was removed in favor of stt. https://github.com/NixOS/nixpkgs/issues/119496"; # added 2021-05-05
  deisctl = throw "deisctl was removed ; the service does not exist anymore"; # added 2022-02-06
  deis = throw "deis was removed ; the service does not exist anymore"; # added 2022-02-06
  deltachat-electron = deltachat-desktop; # added 2021-07-18

  deluge-1_x = throw ''
    Deluge 1.x (deluge-1_x) is no longer supported.
    Please use Deluge 2.x (deluge-2_x) instead, for example:

        services.deluge.package = pkgs.deluge-2_x;

    Note that it is NOT possible to switch back to Deluge 1.x after this change.
  ''; # Added 2021-08-18

  demjson = with python3Packages; toPythonApplication demjson; # Added 2022-01-18
  desktop_file_utils = throw "'desktop_file_utils' has been renamed to/replaced by 'desktop-file-utils'"; # Converted to throw 2022-02-22
  devicemapper = throw "'devicemapper' has been renamed to/replaced by 'lvm2'"; # Converted to throw 2022-02-22
  devserver = throw "'devserver' has been removed in favor of 'miniserve' or other alternatives"; # Added 2023-01-13
  dfu-util-axoloti = throw "dfu-util-axoloti has been removed: abandoned by upstream"; # Added 2022-05-13
  dhall-text = throw "'dhall-text' has been deprecated in favor of the 'dhall text' command from 'dhall'"; # Added 2022-03-26
  dhcp = throw "dhcp (ISC DHCP) has been removed from nixpkgs, because it reached its end of life"; # Added 2023-04-04
  digikam5 = throw "'digikam5' has been renamed to/replaced by 'digikam'"; # Converted to throw 2022-02-22
  dirmngr = throw "dirmngr has been removed: merged into gnupg"; # Added 2022-05-13
  disper = throw "disper has been removed: abandoned by upstream"; # Added 2022-03-18
  dmtx = throw "'dmtx' has been renamed to/replaced by 'dmtx-utils'"; # Converted to throw 2022-02-22
  dnnl = oneDNN; # Added 2020-04-22
  docbook5_xsl = throw "'docbook5_xsl' has been renamed to/replaced by 'docbook_xsl_ns'"; # Converted to throw 2022-02-22
  docbookrx = throw "docbookrx has been removed since it was unmaintained"; # Added 2021-01-12
  docbook_xml_xslt = throw "'docbook_xml_xslt' has been renamed to/replaced by 'docbook_xsl'"; # Converted to throw 2022-02-22
  doh-proxy = throw "doh-proxy has been removed because upstream abandoned it and its dependencies where removed."; # Added 2022-03-30
  docker_compose = throw "'docker_compose' has been renamed to/replaced by 'docker-compose'"; # Converted to throw 2022-02-22
  docker-compose_2 = throw "'docker-compose_2' has been renamed to 'docker-compose'"; # Added 2022-06-05
  docker-edge = throw "'docker-edge' has been removed, it was an alias for 'docker'"; # Added 2022-06-05
  dolphin-emu-beta = dolphin-emu; # Added 2023-02-11
  dolphinEmu = dolphin-emu; # Added 2021-11-10
  dolphinEmuMaster = dolphin-emu-beta; # Added 2021-11-10
  dot-http = throw "'dot-http' has been removed: abandoned by upstream. Use hurl instead."; # Added 2023-01-16
  dotty = scala_3; # Added 2023-08-20
  dotnet-netcore = dotnet-runtime; # Added 2021-10-07
  double_conversion = throw "'double_conversion' has been renamed to/replaced by 'double-conversion'"; # Converted to throw 2022-02-22
  draftsight = throw "draftsight has been removed, no longer available as freeware"; # Added 2020-08-14
  dragon-drop = throw "'dragon-drop' has been removed in favor of 'xdragon'"; # Added 2022-04-10;
  dtv-scan-tables_linuxtv = dtv-scan-tables;  # Added 2023-03-03
  dtv-scan-tables_tvheadend = dtv-scan-tables;  # Added 2023-03-03
  dust = throw "dust has been removed: abandoned by upstream"; # Added 2022-04-21
  dvb_apps = throw "dvb_apps has been removed"; # Added 2020-11-03
  dwarf_fortress = throw "'dwarf_fortress' has been renamed to/replaced by 'dwarf-fortress'"; # Converted to throw 2022-02-22
  dwm-git = throw "dwm-git has been removed from nixpkgs, as it had no updates for 2 years not serving it's purpose"; # Added 2021-02-07
  dylibbundler = macdylibbundler; # Added 2021-04-24

  ### E ###

  eagle7 = throw "eagle7 has been removed because it did not support a supported openssl version"; # added 2021-12-15
  ec2_ami_tools = ec2-ami-tools; # Added 2021-10-08
  ec2_api_tools = ec2-api-tools; # Added 2021-10-08
  ec2-utils = amazon-ec2-utils; # Added 2022-02-01
  elasticmq = throw "elasticmq has been removed in favour of elasticmq-server-bin"; # Added 2021-01-17
  elasticsearch7-oss = throw "elasticsearch7-oss has been removed, as the distribution is no longer provided by upstream. https://github.com/NixOS/nixpkgs/pull/114456"; # Added 2021-06-09

  elasticsearch-oss = throw "elasticsearch-oss has been removed because there is no oss version of elasticsearch anymore. Use opensearch instead."; # Added 2022-10-04
  elasticsearch6 = throw "elasticsearch6 has been removed because it reached end of life"; # Added 2022-10-04
  elasticsearch6-oss = throw "elasticsearch6-oss has been removed because it reached end of life"; # Added 2022-10-04
  elasticsearch6Plugins = throw "elasticsearch6Plugins has been removed because it reached end of life"; # Added 2022-10-04
  elasticsearch7Plugins = elasticsearchPlugins;

  # Electron
  electron_3 = throw "electron_3 has been removed in favor of newer versions"; # added 2022-01-06
  electron_4 = throw "electron_4 has been removed in favor of newer versions"; # added 2022-01-06
  electron_5 = throw "electron_5 has been removed in favor of newer versions"; # added 2022-01-06
  electron_6 = throw "electron_6 has been removed in favor of newer versions"; # added 2022-01-06
  electron_7 = throw "electron_7 has been removed in favor of newer versions"; # added 2022-02-08
  electron_8 = throw "electron_8 has been removed in favor of newer versions"; # added 2022-02-08
  electron_9 = throw "electron_9 has been removed in favor of newer versions"; # added 2023-09-11

  electrum-dash = throw "electrum-dash has been removed from nixpkgs as the project is abandoned"; # Added 2022-01-01
  elementary-planner = throw "elementary-planner has been renamed to planify"; # Added 2023-06-24

  elixir_ls = elixir-ls; # Added 2023-03-20

  # Emacs
  emacs28NativeComp = emacs28; # Added 2022-06-08
  emacs28Packages = emacs28.pkgs; # Added 2021-10-04
  emacs28WithPackages = emacs28.pkgs.withPackages; # Added 2021-10-04
  emacsMacport = emacs-macport; # Added 2023-08-10
  emacsNativeComp = emacs28NativeComp; # Added 2022-06-08
  emacsPackagesGen = throw "'emacsPackagesGen' has been renamed to/replaced by 'emacsPackagesFor'"; # Converted to throw 2022-02-22
  emacsPackagesNg = throw "'emacsPackagesNg' has been renamed to/replaced by 'emacs.pkgs'"; # Converted to throw 2023-09-10
  emacsPackagesNgFor = throw "'emacsPackagesNgFor' has been renamed to/replaced by 'emacsPackagesFor'"; # Converted to throw 2023-09-10
  emacsPackagesNgGen = throw "'emacsPackagesNgGen' has been renamed to/replaced by 'emacsPackagesFor'"; # Converted to throw 2022-02-22
  emacsWithPackages = emacs.pkgs.withPackages; # Added 2020-12-18

  empathy = throw "empathy was removed as it is unmaintained and no longer launches due to libsoup3 migration"; # Added 2023-01-20
  enblendenfuse = throw "'enblendenfuse' has been renamed to/replaced by 'enblend-enfuse'"; # Converted to throw 2022-02-22
  enchant1 = throw "enchant1 has been removed from nixpkgs, as it was unmaintained"; # Added 2023-01-18
  encryptr = throw "encryptr was removed because it reached end of life"; # Added 2022-02-06
  envdir = throw "envdir has been dropped due to the lack of maintenance from upstream since 2018"; # Added 2022-06-03
  envelope = throw "envelope has been removed from nixpkgs, as it was unmaintained"; # Added 2021-08-05
  enyo-doom = enyo-launcher; # Added 2022-09-09
  epoxy = libepoxy; # Added 2021-11-11
  epsxe = throw "epsxe has been removed from nixpkgs, as it was unmaintained."; # added 2021-12-15
  eql = throw "eql has been removed from nixpkgs, because it depended on qt4. eql5 exists, but is not currently pacakged in nixpkgs."; # added 2022-05-09
  inherit (beam.interpreters) erlangR26 erlangR25 erlangR24; # added 2023-03-21
  erlang_21 = throw "erlangR21 has been removed in favor of newer versions."; # added 2023-03-21
  erlangR21 = erlang_21;
  erlang_22 = throw "erlangR22 has been removed in favor of newer versions."; # added 2023-03-21
  erlangR22 = erlang_22;
  erlang_23 = throw "erlangR23 has been removed in favor of newer versions."; # added 2023-09-11
  erlangR23 = erlang_23;
  esniper = throw "esniper has been removed because upstream no longer maintains it (and it no longer works)"; # Added 2021-04-12
  etcdctl = throw "'etcdctl' has been renamed to/replaced by 'etcd'"; # Converted to throw 2022-02-22
  eterm = throw "eterm was removed because it is still insecure: https://github.com/mej/Eterm/issues/7"; # Added 2023-09-10
  eteroj.lv2 = throw "'eteroj.lv2' has been renamed to/replaced by 'open-music-kontrollers.eteroj'"; # Added 2022-03-09
  euca2tools = throw "euca2ools has been removed because it is unmaintained upstream and still uses python2"; # Added 2022-01-01
  evilvte = throw "evilvte has been removed from nixpkgs for being unmaintained with security issues and dependant on an old version of vte which was removed"; # Added 2022-01-14
  evolution_data_server = throw "'evolution_data_server' has been renamed to/replaced by 'evolution-data-server'"; # Converted to throw 2022-02-22
  exa = throw "'exa' has been removed because it is unmaintained upstream. Consider using 'eza', a maintained fork"; # Added 2023-09-07
  exhibitor = throw "'exhibitor' has been removed because it is unmaintained upstream"; # Added 2023-06-20
  exfat-utils = throw "'exfat-utils' has been renamed to/replaced by 'exfat'"; # Converted to throw 2022-02-22

  ### F ###

  facette = throw "facette has been removed"; # Added 2020-01-06
  faustStk = faustPhysicalModeling; # Added 2023-05-16
  faust1 = throw "faust1 has been removed, use faust2 instead"; # Added 2022-12-03
  fast-neural-doodle = throw "fast-neural-doodle has been removed, as the upstream project has been abandoned"; # Added 2020-03-28
  fastnlo = fastnlo_toolkit; # Added 2021-04-24
  fbreader = throw "fbreader has been removed, as the upstream project has been archived"; # Added 2022-05-26
  fedora-coreos-config-transpiler = throw "fedora-coreos-config-transpiler has been renamed to 'butane'"; # Added 2021-04-13
  feedreader = throw "feedreader is no longer activily maintained since 2019. The developer is working on a spiritual successor called NewsFlash."; # Added 2022-05-03
  inherit (luaPackages) fennel; # Added 2022-09-24
  fetchFromGithub = throw "You meant fetchFromGitHub, with a capital H"; # preserve
  ffadoFull = throw "'ffadoFull' has been renamed to/replaced by 'ffado'"; # Converted to throw 2022-02-22
  ffmpeg-sixel = throw "ffmpeg-sixel has been removed, because it was an outdated/unmaintained fork of ffmpeg"; # Added 2022-03-23";
  ffmpeg_3 = throw "ffmpeg_3 was removed from nixpkgs, because it was an outdated and insecure release"; # added 2022-01-17
  filebeat6 = throw "filebeat6 has been removed because it reached end of life"; # Added 2022-10-04
  findimagedupes = throw "findimagedupes has been removed because the perl bindings are no longer compatible"; # Added 2023-07-10
  finger_bsd = bsd-finger;
  fingerd_bsd = bsd-fingerd;
  firefox-esr-68 = throw "Firefox 68 ESR was removed because it reached end of life with its final release 68.12esr on 2020-08-25";
  firefox-esr-wayland = firefox-esr; # Added 2022-11-15
  firefox-esr-wrapper = throw "'firefox-esr-wrapper' has been renamed to/replaced by 'firefox-esr'"; # Converted to throw 2022-02-22
  firefox-wayland = firefox; # Added 2022-11-15
  firefoxWrapper = throw "'firefoxWrapper' has been renamed to/replaced by 'firefox'"; # Converted to throw 2022-02-22
  firefox-wrapper = throw "'firefox-wrapper' has been renamed to/replaced by 'firefox'"; # Converted to throw 2022-02-22
  firmwareLinuxNonfree = linux-firmware; # Added 2022-01-09
  fish-foreign-env = throw "fish-foreign-env has been replaced with fishPlugins.foreign-env"; # Added 2020-12-29, modified 2021-01-10
  fishfight = jumpy; # Added 2022-08-03
  fitnesstrax = throw "fitnesstrax was removed from nixpkgs because it disappeared upstream and no longer compiles"; # added 2023-07-04
  flameGraph = throw "'flameGraph' has been renamed to/replaced by 'flamegraph'"; # Converted to throw 2022-02-22
  flashplayer-standalone-debugger = throw "flashplayer-standalone-debugger has been removed as Adobe Flash Player is now deprecated"; # Added 2021-02-07
  flashplayer-standalone = throw "flashplayer-standalone has been removed as Adobe Flash Player is now deprecated"; # Added 2021-02-07
  flashplayer = throw "flashplayer has been removed as Adobe Flash Player is now deprecated"; # Added 2021-02-07
  flashtool = throw "flashtool was removed from nixpkgs, because the download is down for copyright reasons and the site looks very fishy"; # Added 2021-06-31
  flatbuffers_1_12 = throw "FlatBuffers version 1.12 has been removed, because upstream no longer maintains it"; # Added 2022-05-12
  flatbuffers_2_0 = flatbuffers; # Added 2022-05-12
  flink_1_5 = throw "flink_1_5 was removed, use flink instead"; # Added 2021-01-25
  flutter-beta = throw "Non-stable versions of Flutter have been removed. You can use flutterPackages.mkFlutter to generate a package for other Flutter versions"; # Added 2020-01-15
  flutter-dev = throw "Non-stable versions of Flutter have been removed. You can use flutterPackages.mkFlutter to generate a package for other Flutter versions"; # Added 2020-01-15
  flutter2 = throw "flutter2 has been removed because it isn't updated anymore, and no packages in nixpkgs use it. If you still need it, use flutter.mkFlutter to get a custom version"; # Added 2023-07-03
  flutter37 = throw "flutter37 has been removed because it isn't updated anymore, and no packages in nixpkgs use it. If you still need it, use flutter.mkFlutter to get a custom version"; # Added 2023-07-03
  flvtool2 = throw "flvtool2 has been removed"; # Added 2020-11-03
  fmbt = throw "fmbt was removed, because it depended on qt4 and python2 and was unmaintained upstream"; # Added 2022-06-13
  fme = throw "fme was removed, because it is old and uses Glade, a discontinued library"; # Added 2022-01-26
  foldingathome = fahclient; # Added 2020-09-03
  font-awesome-ttf = throw "'font-awesome-ttf' has been renamed to/replaced by 'font-awesome'"; # Converted to throw 2022-02-22

  fontconfig-penultimate = throw ''
    fontconfig-penultimate has been removed.
    It was a fork of the abandoned fontconfig-ultimate.
  ''; # Added 2020-07-21

  fontconfig_210 = throw ''
    fontconfig 2.10.x hasn't had a release in years, is vulnerable to CVE-2016-5384
    and has only been used for old fontconfig caches.
  '';

  foomatic_filters = throw "'foomatic_filters' has been renamed to/replaced by 'foomatic-filters'"; # Converted to throw 2022-02-22
  foundationdb51 = throw "foundationdb51 is no longer maintained, use foundationdb71 instead"; # added 2023-06-06
  foundationdb52 = throw "foundationdb52 is no longer maintained, use foundationdb71 instead"; # added 2023-06-06
  foundationdb60 = throw "foundationdb60 is no longer maintained, use foundationdb71 instead"; # added 2023-06-06
  foundationdb61 = throw "foundationdb61 is no longer maintained, use foundationdb71 instead"; # added 2023-06-06
  foxitreader = throw "foxitreader has been removed because it had vulnerabilities and was unmaintained"; # added 2023-02-20
  fscryptctl-experimental = throw "The package fscryptctl-experimental has been removed. Please switch to fscryptctl"; # Added 2021-11-07
  fsharp41 = throw "fsharp41 has been removed, please use dotnet-sdk_5 or later";
  fslint = throw "fslint has been removed: end of life. Upstream recommends using czkawka (https://qarmin.github.io/czkawka/) instead"; # Added 2022-01-15
  fuse_exfat = throw "'fuse_exfat' has been renamed to/replaced by 'exfat'"; # Converted to throw 2022-02-22
  fuseki = throw "'fuseki' has been renamed to/replaced by 'apache-jena-fuseki'"; # Converted to throw 2022-02-22
  fuse2fs = if stdenv.isLinux then e2fsprogs.fuse2fs else null; # Added 2022-03-27 preserve, reason: convenience, arch has a package named fuse2fs too.
  fx_cast_bridge = fx-cast-bridge; # added 2023-07-26
  fwupdate = throw "fwupdate was merged into fwupd"; # Added 2020-05-19

  fcitx = throw "fcitx is deprecated, please use fcitx5 instead."; # Added 2023-03-13
  fcitx-engines = throw "fcitx-engines is deprecated, please use fcitx5 instead."; # Added 2023-03-13
  fcitx-configtool = throw "fcitx-configtool is deprecated, please use fcitx5 instead."; # Added 2023-03-13

  ### G ###

  g4py = python3Packages.geant4; # Added 2020-06-06
  gaia = throw "gaia has been removed because it seems abandoned upstream and uses no longer supported dependencies"; # Added 2020-06-06
  gambatte = throw "gambatte has been removed, because the project has been taken private"; # Added 2022-05-26
  gammy = throw "'gammy' is deprecated upstream and has been replaced by 'gummy'"; # Added 2022-09-03
  garmindev = throw "'garmindev' has been removed as the dependent software 'qlandkartegt' has been removed"; # Added 2023-04-17
  gawp = throw "gawp has been dropped due to the lack of maintenance from upstream since 2017"; # Added 2022-06-02
  gdal_1_11 = throw "gdal_1_11 was removed. Use gdal instead"; # Added 2021-04-03
  gdb-multitarget = throw "'gdb-multitarget' has been renamed to/replaced by 'gdb'"; # Converted to throw 2022-02-22
  gdk_pixbuf = throw "'gdk_pixbuf' has been renamed to/replaced by 'gdk-pixbuf'"; # Converted to throw 2022-02-22
  geekbench4 = throw "'geekbench4' has been renamed to 'geekbench_4'"; # Added 2023-03-10
  geekbench5 = throw "'geekbench5' has been renamed to 'geekbench_5'"; # Added 2023-03-10
  getmail = throw "getmail has been removed from nixpkgs, migrate to getmail6"; # Added 2022-01-12
  gettextWithExpat = throw "'gettextWithExpat' has been renamed to/replaced by 'gettext'"; # Converted to throw 2022-02-22
  gfm = throw "gfm has been removed"; # Added 2021-01-15
  ghostwriter = libsForQt5.kdeGear.ghostwriter; # Added 2023-03-18
  giblib = throw " giblib has been removed from nixpkgs because upstream is gone"; # Added 2022-01-23
  giflib_4_1 = throw "giflib_4_1 has been removed; use giflib instead"; # Added 2020-02-12
  git-annex-remote-b2 = throw "git-annex-remote-b2 has been dropped due to the lack of maintenance from upstream since 2016"; # Added 2022-06-02
  git-bz = throw "giz-bz has been removed from nixpkgs as it is stuck on python2"; # Added 2022-01-01
  git-subset = throw "'git-subset' has been removed in favor of 'git-filter-repo'"; # Added 2023-01-13

  gitAndTools = self // {
    darcsToGit = darcs-to-git;
    gitAnnex = git-annex;
    gitBrunch = git-brunch;
    gitFastExport = git-fast-export;
    gitRemoteGcrypt = git-remote-gcrypt;
    svn_all_fast_export = svn-all-fast-export;
    topGit = top-git;
  }; # Added 2021-01-14

  gitin = throw "gitin has been remove because it was unmaintained and depended on an insecure version of libgit2"; # Added 2021-12-07
  gitinspector = throw "gitinspector has been removed because it doesn't work with python3"; # Added 2022-01-12
  gksu = throw "gksu has been removed"; # Added 2022-01-16
  glib_networking = throw "'glib_networking' has been renamed to/replaced by 'glib-networking'"; # Converted to throw 2022-02-22
  glimpse = throw "glimpse was removed, as the project was discontinued. You can use gimp instead."; # Added 2022-07-11
  gmailieer = lieer; # Added 2020-04-19
  gmic-qt-krita = throw "gmic-qt-krita was removed as it's no longer supported upstream."; # Converted to throw 2023-02-02
  gmvault = throw "gmvault has been removed because it is unmaintained, mostly broken, and insecure"; # Added 2021-03-08
  gnash = throw "gnash has been removed; broken and abandoned upstream"; # added 2022-02-06
  gnatboot11 = gnat-bootstrap11;
  gnatboot12 = gnat-bootstrap12;
  gnatboot = gnat-bootstrap;
  gnome-breeze = throw "gnome-breeze has been removed, use libsForQt5.breeze-gtk instead"; # Added 2022-04-22
  gnome-firmware-updater = gnome-firmware; # added 2022-04-14
  gnome-passwordsafe = gnome-secrets; # added 2022-01-30
  gnome-mpv = throw "'gnome-mpv' has been renamed to/replaced by 'celluloid'"; # Converted to throw 2023-09-10
  gnome-sharp = throw "gnome-sharp has been removed from nixpkgs"; # Added 2022-01-15
  gnome-themes-standard = throw "'gnome-themes-standard' has been renamed to/replaced by 'gnome-themes-extra'"; # Converted to throw 2022-02-22
  gnome_user_docs = throw "'gnome_user_docs' has been renamed to/replaced by 'gnome-user-docs'"; # Converted to throw 2023-09-10
  gnome_doc_utils = throw "'gnome_doc_utils' has been renamed to/replaced by 'gnome-doc-utils'"; # Converted to throw 2022-02-22
  gnome_themes_standard = throw "'gnome_themes_standard' has been renamed to/replaced by 'gnome-themes-standard'"; # Converted to throw 2022-02-22

  gnuradio-with-packages = gnuradio3_7.override {
    extraPackages = lib.attrVals [
      "osmosdr" "ais" "gsm" "nacl" "rds" "limesdr"
    ] gnuradio3_7Packages;
  }; # Added 2020-10-16

  gmock = gtest; # moved from top-level 2021-03-14

  gnome3 = gnome; # Added 2021-05-07
  gnupg20 = throw "gnupg20 has been removed from nixpkgs as upstream dropped support on 2017-12-31";# Added 2020-07-12
  gnuradio3_7 = throw "gnuradio3_7 has been removed because it required Python 2"; # Added 2022-01-16
  gnuradio-ais = throw "'gnuradio-ais' has been renamed to/replaced by 'gnuradio3_7.pkgs.ais'"; # Converted to throw 2023-09-10
  gnuradio-gsm = throw "'gnuradio-gsm' has been renamed to/replaced by 'gnuradio3_7.pkgs.gsm'"; # Converted to throw 2023-09-10
  gnuradio-limesdr = throw "'gnuradio-limesdr' has been renamed to/replaced by 'gnuradio3_7.pkgs.limesdr'"; # Converted to throw 2023-09-10
  gnuradio-nacl = throw "'gnuradio-nacl' has been renamed to/replaced by 'gnuradio3_7.pkgs.nacl'"; # Converted to throw 2023-09-10
  gnuradio-osmosdr = throw "'gnuradio-osmosdr' has been renamed to/replaced by 'gnuradio3_7.pkgs.osmosdr'"; # Converted to throw 2023-09-10
  gnuradio-rds = throw "'gnuradio-rds' has been renamed to/replaced by 'gnuradio3_7.pkgs.rds'"; # Converted to throw 2023-09-10
  gnustep-make = throw "'gnustep-make' has been renamed to/replaced by 'gnustep.make'"; # Converted to throw 2022-02-22
  gnuvd = throw "gnuvd was removed because the backend service is missing"; # Added 2020-01-14
  gobby5 = gobby; # Added 2021-02-01
  gobjectIntrospection = throw "'gobjectIntrospection' has been renamed to/replaced by 'gobject-introspection'"; # Converted to throw 2022-02-22

  #godot
  godot = throw "godot has been renamed to godot3 to distinguish from version 4"; # Added 2023-07-16
  godot-export-templates = throw "godot-export-templates has been renamed to godot3-export-templates to distinguish from version 4"; # Added 2023-07-16
  godot-headless = throw "godot-headless has been renamed to godot3-headless to distinguish from version 4"; # Added 2023-07-16
  godot-server = throw "godot-server has been renamed to godot3-server to distinguish from version 4"; # Added 2023-07-16

  gogoclient = throw "gogoclient has been removed, because it was unmaintained"; # Added 2021-12-15
  goklp = throw "goklp has been dropped due to the lack of maintenance from upstream since 2017"; # Added 2022-06-02
  golly-beta = throw "golly-beta has been removed: use golly instead"; # Added 2022-03-21
  goimports = throw "'goimports' has been renamed to/replaced by 'gotools'"; # Converted to throw 2022-02-22
  gometalinter = throw "gometalinter was abandoned by upstream. Consider switching to golangci-lint instead"; # Added 2020-04-23
  googleAuthenticator = throw "'googleAuthenticator' has been renamed to/replaced by 'google-authenticator'"; # Converted to throw 2022-02-22
  googleearth = throw "the non-pro version of Google Earth was removed because it was discontinued and downloading it isn't possible anymore"; # Added 2022-01-22
  google-gflags = throw "'google-gflags' has been renamed to/replaced by 'gflags'"; # Converted to throw 2023-09-10
  google-musicmanager = throw "google-musicmanager has been removed because Google Play Music was discontinued"; # Added 2021-03-07
  google-music-scripts = throw "google-music-scripts has been removed because Google Play Music was discontinued"; # Added 2021-03-07
  gosca = throw "gosca has been dropped due to the lack of maintenance from upstream since 2018"; # Added 2022-06-30
  google-play-music-desktop-player = throw "GPMDP shows a black screen, upstream homepage is dead, use 'ytmdesktop' instead"; # Added 2022-06-16
  go-langserver = throw "go-langserver has been replaced by gopls"; # Added 2022-06-30
  go-mk = throw "go-mk has been dropped due to the lack of maintenance from upstream since 2015"; # Added 2022-06-02
  go-pup = throw "'go-pup' has been renamed to/replaced by 'pup'"; # Converted to throw 2022-02-22
  go-repo-root = throw "go-repo-root has been dropped due to the lack of maintenance from upstream since 2014"; # Added 2022-06-02
  gometer = throw "gometer has been removed from nixpkgs because goLance stopped offering Linux support"; # Added 2023-02-10
  gpgstats = throw "gpgstats has been removed: upstream is gone"; # Added 2022-02-06
  gpshell = throw "gpshell has been removed, because it was unmaintained in nixpkgs"; # added 2021-12-17

  graalvm11 = graalvm11-ce;
  graalvm8-ce = throw "graalvm8-ce has been removed by upstream"; # Added 2021-10-19
  graalvm8 = throw "graalvm8-ce has been removed by upstream"; # Added 2021-10-19
  graalvm8-ee = throw "graalvm8-ee has been removed because it is unmaintained"; # Added 2022-04-15
  graalvm11-ee = throw "graalvm11-ee has been removed because it is unmaintained"; # Added 2022-04-15
  gradio = throw "gradio has been removed because it is unmaintained, use shortwave instead"; # Added 2022-06-03
  gradle_4 = throw "gradle_4 has been removed because it's no longer being updated"; # Added 2023-01-17
  gradle_5 = throw "gradle_5 has been removed because it's no longer being updated"; # Added 2023-01-17
  grafana-mimir = throw "'grafana-mimir' has been renamed to/replaced by 'mimir'"; # Added 2022-06-07
  gr-ais = throw "'gr-ais' has been renamed to/replaced by 'gnuradio3_7.pkgs.ais'"; # Converted to throw 2023-09-10
  grantlee5 = throw "'grantlee5' has been renamed to/replaced by 'libsForQt5.grantlee'"; # Converted to throw 2022-02-22
  graylog = throw "graylog is now available in versions 3.3 up to 5.0. Please mind the upgrade path and choose the appropriate version. Direct upgrading from 3.3 to 4.3 or above is not supported"; # Added 2023-04-24
  gr-gsm = throw "'gr-gsm' has been renamed to/replaced by 'gnuradio3_7.pkgs.gsm'"; # Converted to throw 2023-09-10
  grib-api = throw "grib-api has been replaced by ecCodes => https://confluence.ecmwf.int/display/ECC/GRIB-API+migration"; # Added 2022-01-05
  gringo = clingo; # added 2022-11-27
  gr-limesdr = throw "'gr-limesdr' has been renamed to/replaced by 'gnuradio3_7.pkgs.limesdr'"; # Converted to throw 2023-09-10
  gr-nacl = throw "'gr-nacl' has been renamed to/replaced by 'gnuradio3_7.pkgs.nacl'"; # Converted to throw 2023-09-10
  gr-osmosdr = throw "'gr-osmosdr' has been renamed to/replaced by 'gnuradio3_7.pkgs.osmosdr'"; # Converted to throw 2023-09-10
  gr-rds = throw "'gr-rds' has been renamed to/replaced by 'gnuradio3_7.pkgs.rds'"; # Converted to throw 2023-09-10
  grub2_full = grub2; # Added 2022-11-18
  grub = throw "grub1 was removed after not being maintained upstream for a decade. Please switch to another bootloader"; # Added 2023-04-11
  grv = throw "grv has been dropped due to the lack of maintenance from upstream since 2019"; # Added 2022-06-01
  gsettings_desktop_schemas = throw "'gsettings_desktop_schemas' has been renamed to/replaced by 'gsettings-desktop-schemas'"; # Converted to throw 2022-02-22
  gsl_1 = throw "'gsl_1' has been renamed to/replaced by 'gsl'"; # Added 2022-11-19
  gtk_doc = throw "'gtk_doc' has been renamed to/replaced by 'gtk-doc'"; # Converted to throw 2022-02-22
  gtklick = throw "gtklick has been removed from nixpkgs as the project is stuck on python2"; # Added 2022-01-01
  gtmess = throw "gtmess has been removed, because it was a MSN client."; # add 2021-12-15
  guile-gnome = throw "guile-gnome has been removed"; # Added 2022-01-16
  guileCairo = throw "'guileCairo' has been renamed to/replaced by 'guile-cairo'"; # Converted to throw 2022-02-22
  guileGnome = throw "guile-gnome has been removed"; # Added 2022-01-16
  guileLint = throw "'guileLint' has been renamed to/replaced by 'guile-lint'"; # Converted to throw 2022-02-22
  guile_lib = throw "'guile_lib' has been renamed to/replaced by 'guile-lib'"; # Converted to throw 2022-02-22
  guile_ncurses = throw "'guile_ncurses' has been renamed to/replaced by 'guile-ncurses'"; # Converted to throw 2022-02-22
  gupnp_av = throw "'gupnp_av' has been renamed to/replaced by 'gupnp-av'"; # Converted to throw 2022-02-22
  gupnp_dlna = throw "'gupnp_dlna' has been renamed to/replaced by 'gupnp-dlna'"; # Converted to throw 2022-02-22
  gupnp_igd = throw "'gupnp_igd' has been renamed to/replaced by 'gupnp-igd'"; # Converted to throw 2022-02-22
  gupnptools = throw "'gupnptools' has been renamed to/replaced by 'gupnp-tools'"; # Converted to throw 2022-02-22
  gutenberg = throw "'gutenberg' has been renamed to/replaced by 'zola'"; # Converted to throw 2022-02-22
  gwtdragdrop = throw "gwtdragdrop was removed: abandoned by upstream"; # Added 2022-02-06
  gwtwidgets = throw "gwtwidgets was removed: unmaintained"; # Added 2022-02-06

  ### H ###

  hal-flash = throw "hal-flash has been removed as Adobe Flash Player is now deprecated"; # Added 2021-02-07
  hardlink = throw "hardlink was merged into util-linux since 2019-06-14."; # Added 2022-08-12
  inherit (harePackages) hare harec; # Added 2022-08-10
  hawkthorne = throw "hawkthorne has been removed because it depended on a broken version of love"; # Added 2022-01-15
  haxe_3_2 = throw "'haxe_3_2' has been removed because it is old and no longer used by any packages in nixpkgs"; # Added 2023-03-15
  haxe_3_4 = throw "'haxe_3_4' has been removed because it is old and no longer used by any packages in nixpkgs"; # Added 2023-03-15
  hdr-plus = throw "hdr-plus has been removed because it is unmaintained, often breaks and no longer consumed as a dependency"; # Added 2022-11-08
  heapster = throw "Heapster is now retired. See https://github.com/kubernetes-retired/heapster/blob/master/docs/deprecation.md"; # Added 2022-04-05
  heartbeat6 = throw "heartbeat6 has been removed because it reached end of life"; # Added 2022-10-04
  heimdalFull = throw "'heimdalFull' has been renamed to/replaced by 'heimdal'"; # Converted to throw 2022-02-22
  heme = throw "heme has been removed: upstream is gone"; # added 2022-02-06
  hepmc = throw "'hepmc' has been renamed to/replaced by 'hepmc2'"; # Converted to throw 2023-09-10
  hicolor_icon_theme = throw "'hicolor_icon_theme' has been renamed to/replaced by 'hicolor-icon-theme'"; # Converted to throw 2022-02-22
  holdingnuts = throw "holdingnuts was removed from nixpkgs, as the project is no longer developed"; # Added 2022-05-10
  holochain-go = throw "holochain-go was abandoned by upstream"; # Added 2022-01-01
  htmlTidy = throw "'htmlTidy' has been renamed to/replaced by 'html-tidy'"; # Converted to throw 2022-02-22
  ht-rust = xh; # Added 2021-02-13
  hydra-flakes = throw "hydra-flakes: Flakes support has been merged into Hydra's master. Please use `hydra_unstable` now"; # Added 2020-04-06
  hydra-unstable = hydra_unstable; # added 2022-05-10
  hydrogen_0 = throw "hydrogen_0 has been removed, because it depended on qt4"; # Added 2022-06-13
  hyperspace-cli = throw "hyperspace-cli is out of date, and has been deprecated upstream in favour of using the individual repos instead"; # Added 2022-08-29

  ### I ###

  i3-gaps = i3; # Added 2023-01-03
  i3cat = throw "i3cat has been dropped due to the lack of maintenance from upstream since 2016"; # Added 2022-06-02
  iana_etc = throw "'iana_etc' has been renamed to/replaced by 'iana-etc'"; # Converted to throw 2022-02-22
  iasl = throw "iasl has been removed, use acpica-tools instead"; # Added 2021-08-08
  ibus-qt = throw "ibus-qt has been removed, because it depended on qt4"; # Added 2022-06-09
  ical2org = throw "ical2org has been dropped due to the lack of maintanence from upstream since 2018"; # Added 2022-06-02
  icecat-bin = throw "icecat-bin has been removed, the binary builds are not maintained upstream"; # Added 2022-02-15
  icedtea8_web = throw "'icedtea8_web' has been renamed to/replaced by 'adoptopenjdk-icedtea-web'"; # Converted to throw 2023-09-10
  icedtea_web = throw "'icedtea_web' has been renamed to/replaced by 'adoptopenjdk-icedtea-web'"; # Converted to throw 2023-09-10
  icu59 = throw "icu59 has been removed, use a more recent version instead"; # Added 2022-05-14
  icu65 = throw "icu65 has been removed, use a more recent version instead"; # Added 2022-05-14
  idea = throw "'idea' has been renamed to/replaced by 'jetbrains'"; # Converted to throw 2022-02-22
  ike = throw "ike has been removed, because it was unmaintained"; # Added 2022-05-26
  imapproxy = throw "imapproxy has been removed because it did not support a supported openssl version"; # added 2021-12-15
  imag = throw "'imag' has been removed, upstream gone"; # Added 2023-01-13
  imagemagick7Big = imagemagickBig; # Added 2021-02-22
  imagemagick7 = imagemagick; # Added 2021-02-22
  imagemagick7_light = imagemagick_light; # Added 2021-02-22
  imlib = throw "imlib has been dropped due to the lack of maintenance from upstream since 2004"; # Added 2023-01-04
  impressive = throw "impressive has been removed due to lack of released python 2 support and maintainership in nixpkgs"; # Added 2022-01-27
  instead-launcher = throw "instead-launcher has been removed, because it depended on qt4"; # Added 2023-07-26
  insync-v3 = throw "insync-v3 has been merged into the insync package; use insync instead"; #Added 2023-05-13
  i-score = throw "i-score has been removed: abandoned upstream"; # Added 2020-11-21
  inboxer = throw "inboxer has been removed as it is no longer maintained and no longer works as Google shut down the inbox service this package wrapped";
  index-fm = libsForQt5.mauiPackages.index; # added 2022-05-17
  infiniband-diags = throw "'infiniband-diags' has been renamed to/replaced by 'rdma-core'"; # Converted to throw 2023-09-10
  ino = throw "ino has been removed from nixpkgs, the project is stuck on python2 and upstream has archived the project"; # Added 2022-01-12
  inotifyTools = inotify-tools;
  intecture-agent = throw "intecture-agent has been removed, because it was no longer maintained upstream"; # added 2021-12-15
  intecture-auth = throw "intecture-auth has been removed, because it was no longer maintained upstream"; # added 2021-12-15
  intecture-cli = throw "intecture-cli has been removed, because it was no longer maintained upstream"; # added 2021-12-15
  interfacer = throw "interfacer is deprecated and archived by upstream"; # Added 2022-04-05
  inter-ui = inter; # Added 2021-03-27
  iops = throw "iops was removed: upstream is gone"; # Added 2022-02-06
  ipfs = kubo; # Added 2022-09-27
  ipfs-migrator-all-fs-repo-migrations = kubo-migrator-all-fs-repo-migrations; # Added 2022-09-27
  ipfs-migrator-unwrapped = kubo-migrator-unwrapped; # Added 2022-09-27
  ipfs-migrator = kubo-migrator; # Added 2022-09-27
  iproute = iproute2; # moved from top-level 2021-03-14
  iproute_mptcp = throw "'iproute_mptcp' has been moved to https://github.com/teto/mptcp-flake"; # Converted to throw 2022-10-04
  ipsecTools = throw "ipsecTools has benn removed, because it was no longer maintained upstream"; # Added 2021-12-15
  itch-setup = throw "itch-setup has benn removed, use itch instead"; # Added 2022-06-02

  ### J ###


  jack2Full = jack2; # moved from top-level 2021-03-14
  jami-client-gnome = throw "jami-client-gnome has been removed: abandoned upstream"; # Added 2022-05-15
  jami-client-qt = jami-client; # Added 2022-11-06
  jami-client = jami; # Added 2023-02-10
  jami-daemon = jami.daemon; # Added 2023-02-10
  jami-libclient = throw "jami-libclient has been removed: moved into jami-qt"; # Added 2022-07-29
  jamomacore = throw "jamomacore has been removed: abandoned upstream"; # Added 2020-11-21
  jbidwatcher = throw "jbidwatcher was discontinued in march 2021"; # Added 2021-03-15
  jbuilder = throw "'jbuilder' has been renamed to/replaced by 'dune_1'"; # Converted to throw 2022-02-22
  jd = throw "jd has been dropped due to the lack of maintenance from upstream since 2016"; # Added 2022-06-03
  jellyfin_10_5 = throw "Jellyfin 10.5 is no longer supported and contains a security vulnerability. Please upgrade to a newer version"; # Added 2021-04-26
  jfbpdf = throw "'jfbpdf' has been removed, because it depends on an outdated and insecure version of mupdf"; # Added 2023-06-27
  jfbview = throw "'jfbview' has been removed, because it depends on an outdated and insecure version of mupdf"; # Added 2023-06-27
  jira-cli = throw "jira-cli was removed because it is no longer maintained"; # Added 2023-02-28
  joseki = throw "'joseki' has been renamed to/replaced by 'apache-jena-fuseki'"; # Converted to throw 2022-02-22
  journalbeat = throw "journalbeat7 has been removed upstream. Use filebeat with the journald input instead"; # Added 2022-10-04
  journalbeat6 = throw "journalbeat6 has been removed because it reached end of life"; # Added 2022-10-04
  journalbeat7 = throw "journalbeat7 has been removed upstream. Use filebeat with the journald input instead"; # Added 2022-10-04

  # Julia
  julia_07 = throw "julia_07 has been deprecated in favor of the latest LTS version"; # Added 2020-09-15
  julia_1 = throw "julia_1 has been deprecated in favor of julia_10 as it was ambiguous"; # Added 2021-03-13
  julia_10 = throw "julia_10 has been deprecated in favor of the latest stable version"; # Added 2022-11-15
  julia_11 = throw "julia_11 has been deprecated in favor of the latest stable version"; # Added 2020-09-15
  julia_13 = throw "julia_13 has been deprecated in favor of the latest stable version"; # Added 2021-03-13
  julia_15 = throw "julia_15 has been deprecated in favor of the latest stable version"; # Added 2022-11-15
  julia_10-bin = throw "julia_10-bin has been deprecated in favor of the latest LTS version"; # Added 2021-12-02
  julia_17-bin = throw "julia_17-bin has been deprecated in favor of the latest stable version"; # Added 2022-09-04

  json_glib = throw "'json_glib' has been renamed to/replaced by 'json-glib'"; # Converted to throw 2022-02-22
  jvmci8 = throw "graalvm8 and its tools were deprecated in favor of graalvm8-ce"; # Added 2021-10-15

  ### K ###

  # k3d was a 3d editing software k-3d - "k3d has been removed because it was broken and has seen no release since 2016" Added 2022-01-04
  # now kube3d/k3d will take it's place
  kube3d = k3d; # Added 2022-0705
  k9copy = throw "k9copy has been removed from nixpkgs, as there is no upstream activity"; # Added 2020-11-06
  kafkacat = kcat; # Added 2021-10-07
  kbdKeymaps = throw "kbdKeymaps is not needed anymore since dvp and neo are now part of kbd"; # Added 2021-04-11
  kdeconnect = plasma5Packages.kdeconnect-kde; # Added 2020-10-28
  kdecoration-viewer = throw "kdecoration-viewer has been removed from nixpkgs, as there is no upstream activity"; # Added 2020-06-16
  kdiff3-qt5 = throw "'kdiff3-qt5' has been renamed to/replaced by 'kdiff3'"; # Converted to throw 2022-02-22
  keepass-keefox = throw "'keepass-keefox' has been renamed to/replaced by 'keepass-keepassrpc'"; # Converted to throw 2022-02-22
  keepassx = throw "KeePassX is no longer actively developed. Please consider KeePassXC as a maintained alternative."; # Added 2023-02-17
  keepassx-community = throw "'keepassx-community' has been renamed to/replaced by 'keepassxc'"; # Converted to throw 2022-02-22
  keepassx-reboot = throw "'keepassx-reboot' has been renamed to/replaced by 'keepassx-community'"; # Converted to throw 2022-02-22
  keepassx2 = throw "KeePassX is no longer actively developed. Please consider KeePassXC as a maintained alternative."; # Added 2023-02-17
  keepassx2-http = throw "'keepassx2-http' has been renamed to/replaced by 'keepassx-reboot'"; # Converted to throw 2022-02-22
  keepnote = throw "keepnote has been removed from nixpkgs, as it is stuck on python2"; # Added 2022-01-01
  kerberos = libkrb5; # moved from top-level 2021-03-14
  kexectools = kexec-tools; # Added 2021-09-03
  kexpand = throw "kexpand awless has been dropped due to the lack of maintenance from upstream since 2017"; # Added 2022-06-01
  keybase-go = throw "'keybase-go' has been renamed to/replaced by 'keybase'"; # Converted to throw 2022-02-22
  keysmith = libsForQt5.kdeGear.keysmith; # Added 2021-07-14
  kfctl = throw "kfctl is broken and has been archived by upstream" ; # Added 2023-08-21
  kgx = gnome-console; # Added 2022-02-19
  kibana7-oss = throw "kibana7-oss has been removed, as the distribution is no longer provided by upstream. https://github.com/NixOS/nixpkgs/pull/114456"; # Added 2021-06-09
  kicad-with-packages3d = throw "'kicad-with-packages3d' has been renamed to/replaced by 'kicad'"; # Converted to throw 2023-09-10
  kindlegen = throw "kindlegen has been removed from nixpkgs, as it's abandoned and no longer available for download"; # Added 2021-03-09
  kinetic-cpp-client = throw "kinetic-cpp-client has been removed from nixpkgs, as it's abandoned"; # Added 2020-04-28
  kino = throw "kino has been removed because it was broken and abandoned"; # Added 2021-04-25
  kio-admin = libsForQt5.kdeGear.kio-admin; # Added 2023-03-18
  knockknock = throw "knockknock has been removed from nixpkgs because the upstream project is abandoned"; # Added 2022-01-01
  kodestudio = throw "kodestudio has been removed from nixpkgs, as the nix package has been long unmaintained and out of date."; # Added 2022-06-07
  kodiGBM = kodi-gbm;
  kodiPlain = kodi;
  kodiPlainWayland = kodi-wayland;
  kodiPlugins = kodiPackages; # Added 2021-03-09;
  kramdown-rfc2629 = rubyPackages.kramdown-rfc2629; # Added 2021-03-23
  krb5Full = krb5;
  krename-qt5 = throw "'krename-qt5' has been renamed to/replaced by 'krename'"; # Converted to throw 2022-02-22
  krita-beta = krita; # moved from top-level 2021-12-23
  kube-aws = throw "kube-aws is deprecated and archived by upstream"; # Added 2022-04-05
  kubei = kubeclarity; # Added 2023-05-20
  kubeless = throw "kubeless is deprecated and archived by upstream"; # Added 2022-04-05
  kubicorn = throw "kubicorn has been dropped due to the lack of maintenance from upstream since 2019"; # Added 2022-05-30
  kuma-prometheus-sd = throw "kuma-prometheus-sd has been deprecated upstream"; # Added 2023-07-02
  kvm = throw "'kvm' has been renamed to/replaced by 'qemu_kvm'"; # Converted to throw 2022-02-22

  ### L ###

  larynx = piper-tts; # Added 2023-05-09
  lastfmsubmitd = throw "lastfmsubmitd was removed from nixpkgs as the project is abandoned"; # Added 2022-01-01
  latinmodern-math = lmmath;
  ldgallery = throw "'ldgallery' has been removed from nixpkgs. Use the Flake provided by ldgallery instead"; # Added 2023-07-26
  letsencrypt = throw "'letsencrypt' has been renamed to/replaced by 'certbot'"; # Converted to throw 2022-02-22
  lfs = dysk; # Added 2023-07-03
  libGL_driver = throw "'libGL_driver' has been renamed to/replaced by 'mesa.drivers'"; # Converted to throw 2022-02-22
  libaudit = throw "'libaudit' has been renamed to/replaced by 'audit'"; # Converted to throw 2022-02-22
  libayatana-indicator-gtk2 = throw "'libayatana-indicator-gtk2' has been removed from nixpkgs, as gtk2 is deprecated"; # Added 2022-10-18
  libayatana-indicator-gtk3 = libayatana-indicator; # Added 2022-10-18
  libayatana-appindicator-gtk2 = throw "'libayatana-appindicator-gtk2' has been removed from nixpkgs, as gtk2 is deprecated"; # Added 2022-10-18
  libayatana-appindicator-gtk3 = libayatana-appindicator; # Added 2022-10-18
  libbencodetools = bencodetools; # Added 2022-07-30
  libbluedevil = throw "'libbluedevil' (Qt4) is unmaintained and unused since 'kde4.bluedevil's removal in 2017"; # Added 2022-06-14
  libbpf_1 = libbpf; # Added 2022-12-06
  libcanberra_gtk2 = throw "'libcanberra_gtk2' has been renamed to/replaced by 'libcanberra-gtk2'"; # Converted to throw 2022-02-22
  libcanberra_gtk3 = throw "'libcanberra_gtk3' has been renamed to/replaced by 'libcanberra-gtk3'"; # Converted to throw 2022-02-22
  libcap_manpages = throw "'libcap_manpages' has been renamed to/replaced by 'libcap.doc'"; # Converted to throw 2022-02-22
  libcap_pam = throw "'libcap_pam' has been replaced with 'libcap'"; # Converted to throw 2023-09-10
  libcap_progs = throw "'libcap_progs' has been renamed to/replaced by 'libcap.out'"; # Converted to throw 2022-02-22
  libco-canonical = throw "libco-canonical: Canonical deleted the repo, libco-canonical is not used anymore"; # Added 2021-05-16
  libcroco = throw "libcroco has been removed as it's no longer used in any derivations"; # Added 2020-03-04
  libdbusmenu-glib = throw "'libdbusmenu-glib' has been renamed to/replaced by 'libdbusmenu'"; # Converted to throw 2022-02-22
  libdbusmenu_qt = throw "'libdbusmenu_qt' (Qt4) is deprecated and unused, use 'libsForQt5.libdbusmenu'"; # Added 2022-06-14
  libdbusmenu_qt5 = throw "'libdbusmenu_qt5' has been renamed to/replaced by 'libsForQt5.libdbusmenu'"; # Converted to throw 2022-02-22
  libdigidoc = throw "'libdigidoc' is unused in nixpkgs, deprecated and archived by upstream, use 'libdigidocpp' instead"; # Added 2022-06-03
  liberation_ttf_v1_from_source = throw "'liberation_ttf_v1_from_source' has been renamed to/replaced by 'liberation_ttf_v1'"; # Converted to throw 2022-02-22
  liberation_ttf_v2_from_source = throw "'liberation_ttf_v2_from_source' has been renamed to/replaced by 'liberation_ttf_v2'"; # Converted to throw 2022-02-22
  liberationsansnarrow = throw "'liberationsansnarrow' has been renamed to/replaced by 'liberation-sans-narrow'"; # Converted to throw 2022-02-22
  libgksu = throw "libgksu has been removed"; # Added 2022-01-16
  libgme = game-music-emu; # Added 2022-07-20
  libgnome_keyring = throw "'libgnome_keyring' has been renamed to/replaced by 'libgnome-keyring'"; # Converted to throw 2022-02-22
  libgnome_keyring3 = throw "'libgnome_keyring3' has been renamed to/replaced by 'libgnome-keyring3'"; # Converted to throw 2022-02-22
  libgpgerror = libgpg-error; # Added 2021-09-04
  libgroove = throw "libgroove has been removed, because it depends on an outdated and insecure version of ffmpeg"; # Added 2022-01-21
  libgumbo = throw "'libgumbo' has been renamed to/replaced by 'gumbo'"; # Converted to throw 2022-02-22
  libheimdal = heimdal; # Added 2022-11-18
  libintlOrEmpty = throw "'libintlOrEmpty' has been replaced by gettext"; # Converted to throw 2023-09-10
  libixp_hg = libixp;
  libjpeg_drop = libjpeg_original; # Added 2020-06-05
  libjreen = throw "libjreen has been removed, because it did not support a recent version of qt5"; # Added 2022-06-12
  libjson_rpc_cpp = throw "'libjson_rpc_cpp' has been renamed to/replaced by 'libjson-rpc-cpp'"; # Converted to throw 2022-02-22
  libkml = throw "libkml has been removed from nixpkgs, as it's abandoned and no package needed it"; # Added 2021-11-09
  liblapackWithoutAtlas = throw "'liblapackWithoutAtlas' has been renamed to/replaced by 'lapack-reference'"; # Converted to throw 2022-02-22
  liblastfm = libsForQt5.liblastfm; # Added 2020-06-14
  liblrdf = throw "'liblrdf' has been renamed to/replaced by 'lrdf'"; # Converted to throw 2022-02-22
  libmicrohttpd_0_9_70 = throw "'libmicrohttpd_0_9_70' has been removed because it is insecure, and has been replaced by 'libmicrohttpd_0_9_69' and 'libmicrohttpd_0_9_71'"; # Added 2022-10-10
  libmongo-client = throw "'libmongo-client' has been removed, upstream gone"; # Added 2023-06-22
  libmsgpack = throw "'libmsgpack' has been renamed to/replaced by 'msgpack'"; # Converted to throw 2022-02-22
  libnih = throw "'libnih' has been removed"; # Converted to throw 2022-05-17
  libosmpbf = throw "libosmpbf was removed because it is no longer required by osrm-backend";
  libpng_apng = throw "libpng_apng has been removed, because it is equivalent to libpng"; # Added 2021-03-21
  libpulseaudio-vanilla = libpulseaudio; # Added 2022-04-20
  libqmatrixclient = throw "libqmatrixclient was renamed to libquotient"; # Added 2020-04-09
  libqrencode = throw "'libqrencode' has been renamed to/replaced by 'qrencode'"; # Converted to throw 2022-02-22
  libraw_unstable = throw "'libraw_unstable' has been removed, please use libraw"; # Added 2023-01-30
  librdf = lrdf; # Added 2020-03-22
  librecad2 = throw "'librecad2' has been renamed to/replaced by 'librecad'"; # Converted to throw 2022-02-22
  libressl_3_2 = throw "'libressl_3_2' has reached end-of-life "; # Added 2022-03-19
  libressl_3_5 = throw "'libressl_3_5' has reached end-of-life "; # Added 2023-05-07
  librevisa = throw "librevisa has been removed because its website and source have disappeared upstream"; # Added 2022-09-23
  librsync_0_9 = throw "librsync_0_9 has been removed"; # Added 2021-07-24
  librtlsdr = rtl-sdr; # Added 2023-02-18
  librewolf-wayland = librewolf; # Added 2022-11-15
  libseat = seatd; # Added 2021-06-24
  libsForQt512 = throw "Qt 5 versions prior to 5.15 are no longer supported upstream and have been removed";  # Added 2022-11-24
  libsForQt514 = throw "Qt 5 versions prior to 5.15 are no longer supported upstream and have been removed";  # Added 2022-11-24
  libsForQt515 = libsForQt5;  # Added 2022-11-24
  libspotify = throw "libspotify has been removed because Spotify stopped supporting it"; # added 2022-05-29
  libstdcxxHook = throw "libstdcxx hook has been removed because cc-wrapper is now directly aware of the c++ standard library intended to be used"; # Added 2020-06-22
  libsysfs = throw "'libsysfs' has been renamed to/replaced by 'sysfsutils'"; # Converted to throw 2022-02-22
  libtensorflow-bin = libtensorflow; # Added 2022-09-25
  libtidy = throw "'libtidy' has been renamed to/replaced by 'html-tidy'"; # Converted to throw 2022-02-22
  libtorrentRasterbar = libtorrent-rasterbar; # Added 2020-12-20
  libtorrentRasterbar-1_2_x = libtorrent-rasterbar-1_2_x; # Added 2020-12-20
  libtorrentRasterbar-2_0_x = libtorrent-rasterbar-2_0_x; # Added 2020-12-20
  libtxc_dxtn = throw "libtxc_dxtn was removed 2020-03-16, now integrated in Mesa";
  libtxc_dxtn_s2tc = throw "libtxc_dxtn_s2tc was removed 2020-03-16, now integrated in Mesa";
  libudev = throw "'libudev' has been renamed to/replaced by 'udev'"; # Converted to throw 2022-02-22
  libungif = giflib; # Added 2020-02-12
  libusb = libusb1; # Added 2020-04-28
  libusb1-axoloti = throw "libusb1-axoloti has been removed: axoloti has been removed"; # Added 2022-05-13
  libva-full = throw "'libva-full' has been renamed to/replaced by 'libva'"; # Converted to throw 2022-02-22
  libva1-full = throw "'libva1-full' has been renamed to/replaced by 'libva1'"; # Converted to throw 2022-02-22
  libwnck3 = libwnck;
  libyamlcpp = yaml-cpp; # Added 2023-01-29
  libyamlcpp_0_3 = yaml-cpp_0_3; # Added 2023-01-29
  lightdm_gtk_greeter = lightdm-gtk-greeter; # Added 2022-08-01
  lighttable = throw "'lighttable' crashes (SIGSEGV) on startup, has not been updated in years and depends on deprecated GTK2"; # Added 2022-06-15
  lilyterm = throw "lilyterm has been removed from nixpkgs, because it was relying on a vte version that depended on python2"; # Added 2022-01-14
  lilyterm-git = throw "lilyterm-git has been removed from nixpkgs, because it was relying on a vte version that depended on python2"; # Added 2022-01-14
  links = throw "'links' has been renamed to/replaced by 'links2'"; # Converted to throw 2022-02-22
  linuxband = throw "linuxband has been removed from nixpkgs, as it's abandoned upstream"; # Added 2021-12-09
  llama = walk; # Added 2023-01-23

  # Linux kernels
  linux-rt_5_10 = linuxKernel.kernels.linux_rt_5_10;
  linux-rt_5_15 = linuxKernel.kernels.linux_rt_5_15;
  linux-rt_5_4 = linuxKernel.kernels.linux_rt_5_4;
  linux-rt_6_1 = linuxKernel.kernels.linux_rt_6_1;
  linuxPackages_4_14 = linuxKernel.packages.linux_4_14;
  linuxPackages_4_19 = linuxKernel.packages.linux_4_19;
  linuxPackages_4_9 = linuxKernel.packages.linux_4_9;
  linuxPackages_5_10 = linuxKernel.packages.linux_5_10;
  linuxPackages_5_15 = linuxKernel.packages.linux_5_15;
  linuxPackages_5_18 = linuxKernel.packages.linux_5_18;
  linuxPackages_5_19 = linuxKernel.packages.linux_5_19;
  linuxPackages_5_4 = linuxKernel.packages.linux_5_4;
  linuxPackages_6_0 = linuxKernel.packages.linux_6_0;
  linuxPackages_6_1 = linuxKernel.packages.linux_6_1;
  linuxPackages_6_2 = linuxKernel.packages.linux_6_2;
  linuxPackages_6_3 = linuxKernel.packages.linux_6_3;
  linuxPackages_6_4 = linuxKernel.packages.linux_6_4;
  linuxPackages_6_5 = linuxKernel.packages.linux_6_5;
  linuxPackages_hardkernel_4_14 = linuxKernel.packages.hardkernel_4_14;
  linuxPackages_rpi0 = linuxKernel.packages.linux_rpi1;
  linuxPackages_rpi02w = linuxKernel.packages.linux_rpi3;
  linuxPackages_rpi1 = linuxKernel.packages.linux_rpi1;
  linuxPackages_rpi2 = linuxKernel.packages.linux_rpi2;
  linuxPackages_rpi3 = linuxKernel.packages.linux_rpi3;
  linuxPackages_rpi4 = linuxKernel.packages.linux_rpi4;
  linuxPackages_rt_5_10 = linuxKernel.packages.linux_rt_5_10;
  linuxPackages_rt_5_15 = linuxKernel.packages.linux_rt_5_15;
  linuxPackages_rt_5_4 = linuxKernel.packages.linux_rt_5_4;
  linuxPackages_rt_6_1 = linuxKernel.packages.linux_rt_6_1;
  linux_4_14 = linuxKernel.kernels.linux_4_14;
  linux_4_19 = linuxKernel.kernels.linux_4_19;
  linux_4_9 = linuxKernel.kernels.linux_4_9;
  linux_5_10 = linuxKernel.kernels.linux_5_10;
  linux_5_15 = linuxKernel.kernels.linux_5_15;
  linux_5_18 = linuxKernel.kernels.linux_5_18;
  linux_5_19 = linuxKernel.kernels.linux_5_19;
  linux_5_4 = linuxKernel.kernels.linux_5_4;
  linux_6_0 = linuxKernel.kernels.linux_6_0;
  linux_6_1 = linuxKernel.kernels.linux_6_1;
  linux_6_2 = linuxKernel.kernels.linux_6_2;
  linux_6_3 = linuxKernel.kernels.linux_6_3;
  linux_6_4 = linuxKernel.kernels.linux_6_4;
  linux_6_5 = linuxKernel.kernels.linux_6_5;
  linuxPackages_mptcp = throw "'linuxPackages_mptcp' has been moved to https://github.com/teto/mptcp-flake"; # Converted to throw 2022-10-04
  linux_mptcp = throw "'linux_mptcp' has been moved to https://github.com/teto/mptcp-flake"; # Converted to throw 2022-10-04
  linux_mptcp_95 = throw "'linux_mptcp_95' has been moved to https://github.com/teto/mptcp-flake"; # Converted to throw 2022-10-04
  linux_rpi0 = linuxKernel.kernels.linux_rpi1;
  linux_rpi02w = linuxKernel.kernels.linux_rpi3;
  linux_rpi1 = linuxKernel.kernels.linux_rpi1;
  linux_rpi2 = linuxKernel.kernels.linux_rpi2;
  linux_rpi3 = linuxKernel.kernels.linux_rpi3;
  linux_rpi4 = linuxKernel.kernels.linux_rpi4;
  linux_xanmod_tt = throw "linux_xanmod_tt was removed because upstream no longer offers this option"; # Added 2022-11-01
  linuxPackages_xanmod_tt = throw "linuxPackages_xanmod_tt was removed because upstream no longer offers this option"; # Added 2022-11-01

  # Added 2020-04-04
  linuxPackages_testing_hardened = throw "linuxPackages_testing_hardened has been removed, please use linuxPackages_latest_hardened";
  linux_testing_hardened = throw "linux_testing_hardened has been removed, please use linux_latest_hardened";

  # Added 2021-04-04
  linuxPackages_xen_dom0 = linuxPackages;
  linuxPackages_latest_xen_dom0 = linuxPackages_latest;
  linuxPackages_xen_dom0_hardened = linuxPackages_hardened;
  linuxPackages_latest_xen_dom0_hardened = linuxPackages_latest_hardened;

  # Added 2021-08-16
  linuxPackages_latest_hardened = throw ''
    The attribute `linuxPackages_hardened_latest' was dropped because the hardened patches
    frequently lag behind the upstream kernel. In some cases this meant that this attribute
    had to refer to an older kernel[1] because the latest hardened kernel was EOL and
    the latest supported kernel didn't have patches.

    If you want to use a hardened kernel, please check which kernel minors are supported
    and use a versioned attribute, e.g. `linuxPackages_5_10_hardened'.

    [1] for more context: https://github.com/NixOS/nixpkgs/pull/133587
  '';
  linux_latest_hardened = linuxPackages_latest_hardened;

  linux-steam-integration = throw "linux-steam-integration has been removed, as the upstream project has been abandoned"; # Added 2020-05-22

  loadcaffe = throw "loadcaffe has been removed, as the upstream project has been abandoned"; # Added 2020-03-28
  lobster-two = google-fonts; # Added 2021-07-22
  logstash6 = throw "logstash6 has been removed because it reached end of life"; # Added 2022-10-04
  logstash6-oss = throw "logstash6 has been removed because it reached end of life"; # Added 2022-10-04
  love_0_7 = throw "love_0_7 was removed because it is a very old version and no longer used by any package in nixpkgs"; # Added 2022-01-15
  love_0_8 = throw "love_0_8 was removed because it is a very old version and no longer used by any package in nixpkgs"; # Added 2022-01-15
  love_0_9 = throw "love_0_9 was removed because was broken for a long time and no longer used by any package in nixpkgs"; # Added 2022-01-15
  lprof = throw "lprof has been removed as it's unmaintained upstream and broken in nixpkgs since a while ago"; # Added 2021-02-15
  lttngTools = throw "'lttngTools' has been renamed to/replaced by 'lttng-tools'"; # Converted to throw 2022-02-22
  lttngUst = throw "'lttngUst' has been renamed to/replaced by 'lttng-ust'"; # Converted to throw 2022-02-22
  lua5_1_sockets = throw "'lua5_1_sockets' has been renamed to/replaced by 'lua51Packages.luasocket'"; # Converted to throw 2022-02-22
  lua5_expat = throw "'lua5_expat' has been renamed to/replaced by 'luaPackages.luaexpat'"; # Converted to throw 2022-02-22
  lua5_sec = throw "'lua5_sec' has been renamed to/replaced by 'luaPackages.luasec'"; # Converted to throw 2022-02-22
  lumo = throw "lumo has been removed: abandoned by upstream"; # Added 2022-04-25
  lumpy = throw "lumpy has been removed from nixpkgs, as it is stuck on python2"; # Added 2022-01-12
  luxcorerender = throw "'luxcorerender' has been removed as it's unmaintained and broken in nixpkgs since a while ago"; # Added 2023-06-07
  lxappearance-gtk3 = throw "lxappearance-gtk3 has been removed. Use lxappearance instead, which now defaults to Gtk3"; # Added 2020-06-03
  lzma = xz; # moved from top-level 2021-03-14

  ### M ###

  m3d-linux = throw "'m3d-linux' has been renamed to/replaced by 'm33-linux'"; # Converted to throw 2022-02-22
  MACS2 = macs2; # Added 2023-06-12
  mail-notification = throw "mail-notification has been removed from nixpkgs, as it's unmaintained and has dependencies on old gnome libraries we want to remove"; # Added 2021-08-21
  mailpile = throw "mailpile was removed from nixpkgs, as it is stuck on python2"; # Added 2022-01-12
  man_db = throw "'man_db' has been renamed to/replaced by 'man-db'"; # Converted to throw 2022-02-22
  manul = throw "manul has been dropped due to the lack of maintenance from upstream since 2018"; # Added 2022-06-01
  manpages = throw "'manpages' has been renamed to/replaced by 'man-pages'"; # Converted to throw 2022-02-22
  marathon = throw "marathon has been removed from nixpkgs, as it's unmaintained"; # Added 2020-08-15
  mariadb_104 = throw "mariadb_104 has been removed from nixpkgs, please switch to another version like mariadb_106"; # Added 2023-09-11
  mariadb_108 = throw "mariadb_108 has been removed from nixpkgs, please switch to another version like mariadb_1010"; # Added 2022-05-10
  mariadb_109 = throw "mariadb_109 has been removed from nixpkgs, please switch to another version like mariadb_1010"; # Added 2022-05-10
  mariadb-client = hiPrio mariadb.client; #added 2019.07.28
  markdown-pp = throw "markdown-pp was removed from nixpkgs, because the upstream archived it on 2021-09-02"; # Added 2023-07-22
  markmind = throw "markmind has been removed from nixpkgs, because it depended on an old version of electron"; # Added 2023-09-12
  marp = throw "marp has been removed from nixpkgs, as it's unmaintained and has security issues"; # Added 2022-06-04
  matcha = throw "matcha was renamed to matcha-gtk-theme"; # added 2020-05-09
  mathics = throw "mathics has been removed from nixpkgs, as it's unmaintained"; # Added 2020-08-15
  matrique = spectral; # Added 2020-01-27
  matrix-recorder = throw "matrix-recorder has been removed due to being unmaintained"; # Added 2023-05-21
  maui-nota = libsForQt5.mauiPackages.nota; # added 2022-05-17
  mcgrid = throw "mcgrid has been removed from nixpkgs, as it's not compatible with rivet 3"; # Added 2020-05-23
  mcomix3 = mcomix; # Added 2022-06-05
  mediatomb = throw "mediatomb is no longer maintained upstream, use gerbera instead"; # added 2022-01-04
  meli = throw "'meli' has been removed as it requires an outdated version of openssl"; # added 2023-05-12
  meme = meme-image-generator; # Added 2021-04-21
  memtest86 = throw "'memtest86' has been renamed to/replaced by 'memtest86plus'"; # Converted to throw 2022-02-22
  mercurial_4 = throw "mercurial_4 has been removed as it's unmaintained"; # Added 2021-10-18
  mesos = throw "mesos has been removed from nixpkgs, as it's unmaintained"; # Added 2020-08-15
  mess = throw "'mess' has been renamed to/replaced by 'mame'"; # Converted to throw 2023-09-10
  metal = throw "metal has been removed due to lack of maintainers";
  metricbeat6 = throw "metricbeat6 has been removed because it reached end of life"; # Added 2022-10-04
  microsoft_gsl = microsoft-gsl; # Added 2023-05-26
  mididings = throw "mididings has been removed from nixpkgs as it doesn't support recent python3 versions and its upstream stopped maintaining it"; # Added 2022-01-12
  midoriWrapper = throw "'midoriWrapper' has been renamed to/replaced by 'midori'"; # Converted to throw 2022-02-22
  mime-types = mailcap; # Added 2022-01-21
  mimms = throw "mimms has been removed from nixpkgs as the upstream project is stuck on python2"; # Added 2022-01-01
  minergate-cli = throw "minergatecli has been removed from nixpkgs, because the package is unmaintained and the site has a bad reputation"; # Added 2021-08-13
  minergate = throw "minergate has been removed from nixpkgs, because the package is unmaintained and the site has a bad reputation"; # Added 2021-08-13
  minetestclient_4 = throw "minetestclient_4 has been removed from Nixpkgs; current version is available at minetest or minetestclient"; # added 2022-02-01
  minetestserver_4 = throw "minetestserver_4 has been removed from Nixpkgs; current version is available at minetestserver"; # added 2022-02-01
  minetime = throw "minetime has been removed from nixpkgs, because it was discontinued 2021-06-22"; # Added 2021-10-14
  miniupnpc_1 = throw "miniupnpc_1 has been removed; current version is available at miniupnpc"; # Added 2022-10-30
  minizip2 = pkgs.minizip-ng; # Added 2022-12-28
  mist = throw "mist has been removed as the upstream project has been abandoned, see https://github.com/ethereum/mist#mist-browser-deprecated"; # Added 2020-08-15
  mlt-qt5 = throw "'mlt-qt5' has been renamed to/replaced by 'libsForQt5.mlt'"; # Converted to throw 2022-02-22
  mobile_broadband_provider_info = throw "'mobile_broadband_provider_info' has been renamed to/replaced by 'mobile-broadband-provider-info'"; # Converted to throw 2022-02-22
  moby = throw "moby has been removed, merged into linuxkit in 2018.  Use linuxkit instead";
  module_init_tools = throw "'module_init_tools' has been renamed to/replaced by 'kmod'"; # Converted to throw 2022-02-22
  monero = monero-cli; # Added 2021-11-28
  moku = throw "moku: Unusable since 2.6.2, not maintained upstream anymore"; # Added 2022-02-26
  mongodb-3_4 = throw "mongodb-3_4 has been removed, it's end of life since January 2020"; # Added 2022-11-30
  mongodb-3_6 = throw "mongodb-3_6 has been removed, it's end of life since April 2021"; # Added 2022-11-30
  mongodb-4_0 = throw "mongodb-4_0 has been removed, it's end of life since April 2022"; # Added 2023-01-05
  mongodb-4_2 = throw "mongodb-4_2 has been removed, it's end of life since April 2023"; # Added 2023-06-06
  monodevelop = throw "monodevelop has been removed from nixpkgs"; # Added 2022-01-15
  mopidy-gmusic = throw "mopidy-gmusic has been removed because Google Play Music was discontinued"; # Added 2021-03-07
  mopidy-local-images = throw "mopidy-local-images has been removed as it's unmaintained. Its functionality has been merged into the mopidy-local extension"; # Added 2020-10-18
  mopidy-local-sqlite = throw "mopidy-local-sqlite has been removed as it's unmaintained. Its functionality has been merged into the mopidy-local extension"; # Added 2020-10-18
  mopidy-spotify-tunigo = throw "mopidy-spotify-tunigo has been removed because Spotify stopped supporting libspotify"; # added 2022-05-29

  morituri = throw "'morituri' has been renamed to/replaced by 'whipper'"; # Converted to throw 2022-02-22
  moz-phab = mozphab; # Added 2022-08-09
  mozart-binary = throw "'mozart-binary' has been renamed to/replaced by 'mozart2-binary'"; # Converted to throw 2023-09-10
  mozart = throw "'mozart' has been renamed to/replaced by 'mozart2-binary'"; # Converted to throw 2023-09-10
  mpc_cli = mpc-cli; # moved from top-level 2022-01-24
  mpd_clientlib = libmpdclient; # Added 2021-02-11
  mpich2 = throw "'mpich2' has been renamed to/replaced by 'mpich'"; # Converted to throw 2022-02-22
  mps-youtube = throw "'mps-youtube' has been removed as it's unmaintained and stopped working. Use 'yewtube', a maintained fork"; # Added 2022-12-29
  mqtt-bench = throw "mqtt-bench has been dropped due to the lack of maintenance from upstream since 2017"; # Added 2022-06-02
  msf = throw "'msf' has been renamed to/replaced by 'metasploit'"; # Converted to throw 2022-02-22
  multimc = throw "multimc was removed from nixpkgs; use prismlauncher instead (see https://github.com/NixOS/nixpkgs/pull/154051 for more information)"; # Added 2022-01-08
  mumble_git = throw "'mumble_git' has been renamed to/replaced by 'pkgs.mumble'"; # Converted to throw 2023-09-10
  murmur_git = throw "'murmur_git' has been renamed to/replaced by 'pkgs.murmur'"; # Converted to throw 2023-09-10
  mutt-with-sidebar = mutt; # Added 2022-09-17
  mysql-client = hiPrio mariadb.client;
  mysql = mariadb; # moved from top-level 2021-03-14
  mysql57 = throw "'mysql57' has been removed. Please use 'mysql80' or 'mariadb'";

  # floating point textures patents are expired,
  # so package reduced to alias
  mesa_drivers = mesa.drivers;
  mesa_noglu = throw "'mesa_noglu' has been renamed to/replaced by 'mesa'"; # Converted to throw 2022-02-22

  mpv-with-scripts = throw "'mpv-with-scripts' has been renamed to/replaced by 'mpv' or with 'mpv.override { scripts = [ mpvScripts.plugin-name ]; }' if you where using plugins."; # Converted to throw 2022-09-24
  mssys = throw "'mssys' has been renamed to/replaced by 'ms-sys'"; # Converted to throw 2022-02-22
  multipath_tools = throw "'multipath_tools' has been renamed to/replaced by 'multipath-tools'"; # Converted to throw 2022-02-22
  mumsi = throw "mumsi has been removed from nixpkgs, as it's unmaintained and does not build anymore"; # Added 2021-11-18
  mupen64plus1_5 = throw "'mupen64plus1_5' has been renamed to/replaced by 'mupen64plus'"; # Converted to throw 2022-02-22
  mx = throw "graalvm8 and its tools were deprecated in favor of graalvm8-ce"; # Added 2021-10-15
  mxisd = throw "mxisd has been removed from nixpkgs as it has reached end of life, see https://github.com/kamax-matrix/mxisd/blob/535e0a5b96ab63cb0ddef90f6f42c5866407df95/EOL.md#end-of-life-notice . ma1sd may be a suitable alternative"; # Added 2021-04-15
  mysqlWorkbench = throw "'mysqlWorkbench' has been renamed to/replaced by 'mysql-workbench'"; # Converted to throw 2022-02-22
  myxer = throw "Myxer has been removed from nixpkgs, as it has been unmaintained since Jul 31, 2021"; # Added 2022-06-08

  ### N ###

  namecoin = throw "namecoin GUI has been removed, because it depended on qt4"; # Added 2022-05-26
  navipowm = throw "navipowm has been removed, because it was unmaintained upstream"; # Added 2022-05-26
  ncdu_2 = ncdu; # Added 2022-07-22
  nccl = throw "nccl has been renamed to cudaPackages.nccl"; # Added 2022-04-04
  nccl_cudatoolkit_10 = throw "nccl_cudatoolkit_10 has been renamed to cudaPackages_10.nccl"; # Added 2022-04-04
  nccl_cudatoolkit_11 = throw "nccl_cudatoolkit_11 has been renamed to cudaPackages_11.nccl"; # Added 2022-04-04

  net_snmp = throw "'net_snmp' has been renamed to/replaced by 'net-snmp'"; # Converted to throw 2023-09-10
  nagiosPluginsOfficial = monitoring-plugins;
  navit = throw "navit has been removed from nixpkgs, due to being unmaintained"; # Added 2021-06-07
  ncat = throw "'ncat' has been renamed to/replaced by 'nmap'"; # Converted to throw 2022-02-22
  neap = throw "neap was removed from nixpkgs, as it relies on python2"; # Added 2022-01-12
  neochat = libsForQt5.kdeGear.neochat; # added 2022-05-10
  netease-cloud-music = throw "netease-cloud-music has been removed together with deepin"; # Added 2020-08-31
  nettools_mptcp = throw "'nettools_mptcp' has been moved to https://github.com/teto/mptcp-flake"; # Converted to throw 2022-10-04
  networkmanager_fortisslvpn = throw "'networkmanager_fortisslvpn' has been renamed to/replaced by 'networkmanager-fortisslvpn'"; # Converted to throw 2022-02-22
  networkmanager_iodine = throw "'networkmanager_iodine' has been renamed to/replaced by 'networkmanager-iodine'"; # Converted to throw 2022-02-22
  networkmanager_l2tp = throw "'networkmanager_l2tp' has been renamed to/replaced by 'networkmanager-l2tp'"; # Converted to throw 2022-02-22
  networkmanager_openconnect = throw "'networkmanager_openconnect' has been renamed to/replaced by 'networkmanager-openconnect'"; # Converted to throw 2022-02-22
  networkmanager_openvpn = throw "'networkmanager_openvpn' has been renamed to/replaced by 'networkmanager-openvpn'"; # Converted to throw 2022-02-22
  networkmanager_vpnc = throw "'networkmanager_vpnc' has been renamed to/replaced by 'networkmanager-vpnc'"; # Converted to throw 2022-02-22
  neutral-style = throw "neural-style has been removed, as the upstream project has been abandoned"; # Added 2020-03-28
  neuron-notes = throw "'neuron-notes' has been decontinued, migrate to 'emanote' instead."; # Added 2022-12-18
  nfsUtils = throw "'nfsUtils' has been renamed to/replaced by 'nfs-utils'"; # Converted to throw 2022-02-22
  nginxUnstable = throw "'nginxUnstable' has been renamed to/replaced by 'nginxMainline'"; # Converted to throw 2022-02-22
  nilfs_utils = throw "'nilfs_utils' has been renamed to/replaced by 'nilfs-utils'"; # Converted to throw 2022-02-22
  nitrokey-udev-rules = libnitrokey; # Added 2023-03-25
  nix-direnv-flakes = nix-direnv;
  nix-review = throw "'nix-review' has been renamed to/replaced by 'nixpkgs-review'"; # Converted to throw 2023-09-10
  nixFlakes = nixVersions.stable; # Added 2021-05-21
  nixStable = nixVersions.stable; # Added 2022-01-24
  nixUnstable = nixVersions.unstable; # Added 2022-01-26
  nix_2_3 = nixVersions.nix_2_3;
  nix_2_4 = nixVersions.nix_2_4;
  nix_2_5 = nixVersions.nix_2_5;
  nix_2_6 = nixVersions.nix_2_6;
  nixopsUnstable = nixops_unstable; # Added 2022-03-03
  nixosTest = testers.nixosTest; # Added 2022-05-05
  nixui = throw "nixui has been removed from nixpkgs, due to the project being unmaintained"; # Added 2022-05-23
  nmap-unfree = nmap; # Added 2021-04-06
  nmap-graphical = throw "nmap graphical support has been removed due to its python2 dependency"; # Added 2022-04-26
  nmap_graphical = throw "nmap graphical support has been removed due to its python2 dependency"; # Modified 2022-04-26
  nodejs_10 = throw "nodejs-10_x has been removed. Use a newer version instead."; # Added 2022-05-31
  nodejs-10_x = nodejs_10; # Added 2022-11-06
  nodejs_12 = throw "nodejs-12_x has been removed. Use a newer version instead."; # Added 2022-07-04
  nodejs-12_x = nodejs_12; # Added 2022-11-06
  nodejs-14_x = nodejs_14; # Added 2022-11-06
  nodejs-slim-14_x = nodejs-slim_14; # Added 2022-11-06
  nodejs-16_x = nodejs_16; # Added 2022-11-06
  nodejs-16_x-openssl_1_1 = throw "nodejs-16_x-openssl_1_1 has been removed."; # Added 2023-02-04
  nodejs-slim-16_x = nodejs-slim_16; # Added 2022-11-06
  nodejs-18_x = nodejs_18; # Added 2022-11-06
  nodejs-slim-18_x = nodejs-slim_18; # Added 2022-11-06
  nologin = throw "'nologin' has been renamed to/replaced by 'shadow'"; # Converted to throw 2022-02-22
  nomad_1_1 = throw "nomad_1_1 has been removed because it's outdated. Use a a newer version instead"; # Added 2022-05-22
  nomad_1_2 = throw "nomad_1_2 has been removed because it's outdated. Use a a newer version instead"; # Added 2023-09-02
  nomad_1_3 = throw "nomad_1_3 has been removed because it's outdated. Use a a newer version instead"; # Added 2023-09-02
  nordic-polar = throw "nordic-polar was removed on 2021-05-27, now integrated in nordic"; # Added 2021-05-27
  noto-fonts-cjk = noto-fonts-cjk-sans; # Added 2021-12-16
  noto-fonts-emoji = noto-fonts-color-emoji; # Added 2023-09-09
  noto-fonts-extra = noto-fonts; # Added 2023-04-08
  nottetris2 = throw "nottetris2 was removed because it is unmaintained by upstream and broken"; # Added 2022-01-15
  now-cli = throw "now-cli has been replaced with nodePackages.vercel"; # Added 2021-08-05
  ntrack = throw "ntrack has been removed, because it depended on qt4"; # Added 2022-05-12
  ntdb = throw "ntdb has been removed: abandoned by upstream"; # Added 2022-04-21
  nxproxy = throw "'nxproxy' has been renamed to/replaced by 'nx-libs'"; # Converted to throw 2022-02-22

  ### O ###

  o = orbiton; # Added 2023-04-09
  oathToolkit = oath-toolkit; # Added 2022-04-04
  oci-image-tool = throw "oci-image-tool is no longer actively maintained, and has had major deficiencies for several years."; # Added 2022-05-14;
  oracleXE = throw "oracleXE has been removed, as it's heavily outdated and unmaintained"; # Added 2020-10-09
  OVMF-CSM = throw "OVMF-CSM has been removed in favor of OVMFFull"; # Added 2021-10-16
  OVMF-secureBoot = throw "OVMF-secureBoot has been removed in favor of OVMFFull"; # Added 2021-10-16
  oauth2_proxy = oauth2-proxy; # Added 2021-04-18
  ocropus = throw "ocropus has been removed: abandoned by upstream"; # Added 2022-04-24
  octoprint-plugins = throw "octoprint-plugins are now part of the octoprint.python.pkgs package set"; # Added 2021-01-24
  ocz-ssd-guru = throw "ocz-ssd-guru has been removed due to there being no source available"; # Added 2021-07-12
  odpdown = throw "odpdown has been removed because it lacks python3 support"; # Added 2022-04-25
  ofp = throw "ofp is not compatible with odp-dpdk";
  ogre1_9 = throw "ogre1_9 has been removed, use ogre instead"; # Added 2023-03-22
  ogre1_10 = throw "ogre1_10 has been removed, use ogre instead"; # Added 2023-07-20
  olifant = throw "olifant has been removed from nixpkgs, as it was unmaintained"; # Added 2021-08-05
  omapd = throw "omapd has been removed from nixpkgs, as it was unmaintained"; # Added 2022-05-09
  opa = throw "opa has been removed from nixpkgs as upstream has abandoned the project"; # Added 2023-03-21
  opam_1_2 = throw "'opam_1_2' has been renamed to/replaced by 'opam'"; # Added 2023-03-08
  openafs_1_8 = openafs; # Added 2022-08-22
  openbazaar = throw "openbazzar has been removed from nixpkgs as upstream has abandoned the project"; # Added 2022-01-06
  openbazaar-client = throw "openbazzar-client has been removed from nixpkgs as upstream has abandoned the project"; # Added 2022-01-06
  opencascade_oce = throw "'opencascade_oce' has been renamed to/replaced by 'opencascade'"; # Converted to throw 2022-02-22
  opencl-icd = throw "'opencl-icd' has been renamed to/replaced by 'ocl-icd'"; # Converted to throw 2022-02-22
  openconnect_head = openconnect_unstable; # Added 2022-03-29
  openconnect_gnutls = openconnect; # Added 2022-03-29
  openconnect_pa = throw "openconnect_pa fork has been discontinued, support for GlobalProtect is now available in openconnect"; # Added 2021-05-21
  openconnect_unstable = throw "openconnect_unstable was removed from nixpkgs as it was not being updated"; # Added 2023-06-01
  openelec-dvb-firmware = libreelec-dvb-firmware; # Added 2021-05-10
  openexr_ctl = throw "'openexr_ctl' has been renamed to/replaced by 'ctl'"; # Converted to throw 2022-02-22
  openimagedenoise_1_2_x = throw "'openimagedenoise_1_2_x' has been renamed to/replaced by 'openimagedenoise'"; # Added 2023-06-07
  openimageio2 = openimageio; # Added 2023-01-05
  openimageio_1 = throw "'openimageio_1' has been removed, please update to 'openimageio' 2"; # Added 2023-06-14
  openisns = open-isns; # Added 2020-01-28
  openjpeg_1 = throw "openjpeg_1 has been removed, use openjpeg_2 instead"; # Added 2021-01-24
  openjpeg_2 = openjpeg; # Added 2021-01-25
  openmpt123 = libopenmpt; # Added 2021-09-05
  opensans-ttf = throw "'opensans-ttf' has been renamed to/replaced by 'open-sans'"; # Converted to throw 2022-02-22
  openssh_with_kerberos = throw "'openssh_with_kerberos' has been renamed to/replaced by 'openssh'"; # Converted to throw 2022-02-22
  openssl_3_0 = openssl_3; # Added 2022-06-27
  openvpn_24 = throw "openvpn_24 has been removed, because it went EOL. 2.5.x or newer is still available"; # Added 2023-01-23
  orchis = orchis-theme; # Added 2021-06-09
  osxfuse = macfuse-stubs; # Added 2021-03-20
  otter-browser = throw "otter-browser has been removed from nixpkgs, as it was unmaintained"; # Added 2020-02-02
  owncloudclient = throw "'owncloudclient' has been renamed to/replaced by 'owncloud-client'"; # Converted to throw 2022-02-22

  ### P ###

  PPSSPP = throw "'PPSSPP' has been renamed to/replaced by 'ppsspp'"; # Converted to throw 2022-02-22

  p11_kit = throw "'p11_kit' has been renamed to/replaced by 'p11-kit'"; # Converted to throw 2022-02-22
  packet-cli = metal-cli; # Added 2021-10-25
  palemoon = throw "palemoon has been dropped due to python2 being EOL and marked insecure. Use 'palemoon-bin' instead"; # Added 2023-05-18
  paperless = paperless-ngx; # Added 2021-06-06
  paperless-ng = paperless-ngx; # Added 2022-04-11
  paper-note = throw "paper-note has been removed: abandoned by upstream"; # Added 2023-05-03
  parity = openethereum; # Added 2020-08-01
  parity-ui = throw "parity-ui was removed because it was broken and unmaintained by upstream"; # Added 2022-01-10
  parquet-cpp = throw "'parquet-cpp' has been renamed to/replaced by 'arrow-cpp'"; # Converted to throw 2022-02-22
  patchmatrix = throw "'patchmatrix' has been renamed to/replaced by 'open-music-kontrollers.patchmatrix'"; # Added 2022-03-09
  pash = throw "'pash' has been removed: abandoned by upstream. Use 'powershell' instead"; # Added 2023-09-16
  pass-otp = throw "'pass-otp' has been renamed to/replaced by 'pass.withExtensions'"; # Converted to throw 2022-02-22
  pbis-open = throw "pbis-open has been removed, because it is no longer maintained upstream"; # added 2021-12-15
  pdf-redact-tools = throw "pdf-redact-tools has been removed from nixpkgs because the upstream has abandoned the project"; # Added 2022-01-01
  pdf2htmlEx = throw "pdf2htmlEx has been removed from nixpkgs, as it was unmaintained"; # Added 2020-11-03
  pdfmod = throw "pdfmod has been removed"; # Added 2022-01-15
  pdfread = throw "pdfread has been remove because it is unmaintained for years and the sources are no longer available"; # Added 2021-07-22
  pdfstudio = throw "'pdfstudio' has been replaced with 'pdfstudio<year>', where '<year>' is the year from the PDF Studio version number, because each license is specific to a given year"; # Added 2022-09-04
  peach = asouldocs; # Added 2022-08-28
  pentablet-driver = xp-pen-g430-driver; # Added 2022-06-23
  percona-server = percona-server56; # Added 2022-11-01
  percona-server56 = throw "'percona-server56' has been dropped due to lack of maintenance, no upstream support and security issues"; # Added 2022-11-01
  percona-xtrabackup_2_4 = throw "'percona-xtrabackup_2_4' has been renamed to/replaced by 'percona-xtrabackup'"; # Added 2022-12-23
  perldevel = throw "'perldevel' has been dropped due to lack of updates in nixpkgs and lack of consistent support for devel versions by 'perl-cross' releases, use 'perl' instead";
  perldevelPackages = perldevel;
  perlXMLParser = throw "'perlXMLParser' has been renamed to/replaced by 'perlPackages.XMLParser'"; # Converted to throw 2022-02-22
  perlArchiveCpio = throw "'perlArchiveCpio' has been renamed to/replaced by 'perlPackages.ArchiveCpio'"; # Converted to throw 2022-02-22
  pgadmin = pgadmin4;
  pgadmin3 = throw "pgadmin3 was removed for being unmaintained, use pgadmin4 instead."; # Added 2022-03-30
  pgp-tools = throw "'pgp-tools' has been renamed to/replaced by 'signing-party'"; # Converted to throw 2022-02-22
  pg_tmp = throw "'pg_tmp' has been renamed to/replaced by 'ephemeralpg'"; # Converted to throw 2022-02-22
  phantomjs = throw "phantomjs 1.9.8 has been dropped due to lack of maintenance and security issues"; # Added 2022-02-20
  phantomjs2 = throw "phantomjs2 has been dropped due to lack of maintenance"; # Added 2022-04-22
  pharo-spur64 = pharo; # Added 2022-08-03
  pharo-spur32 = throw "pharo on 32bits is currently not supported due to lack of maintenance"; # Added 2022-08-03
  pharo-cog32 = throw "the cog32 VM has been outdated for about a decade now, time to move on"; # Added 2022-08-03
  pharo-launcher = throw "pharo launcher has been dropped due to lack of maintenance"; # Added 2022-08-03
  philter = throw "philter has been removed: abandoned by upstream"; # Added 2022-04-26
  phodav_2_0 = throw "'phodav_2_0' has been renamed to/replaced by 'phodav'"; # Added 2023-02-21
  photoflow = throw "photoflow was removed because it was broken and unmaintained by upstream"; # Added 2023-03-10
  phraseapp-client = throw "phraseapp-client is archived by upstream. Use phrase-cli instead"; # Added 2022-05-15
  phwmon = throw "phwmon has been removed: abandoned by upstream"; # Added 2022-04-24

  # Obsolete PHP version aliases
  php80 = throw "php80 has been dropped due to the lack of maintenance from upstream for future releases"; # Added 2023-06-21
  php80Packages = php80; # Added 2023-06-21
  php80Extensions = php80; # Added 2023-06-21

  php74 = throw "php74 has been dropped due to the lack of maintenance from upstream for future releases"; # Added 2022-05-24
  php74Packages = php74; # Added 2022-05-24
  php74Extensions = php74; # Added 2022-05-24

  php73 = throw "php73 has been dropped due to the lack of maintenance from upstream for future releases"; # Added 2021-06-03
  php73Packages = php73; # Added 2021-06-03
  php73Extensions = php73; # Added 2021-06-03

  php-embed = throw ''
    php*-embed has been dropped, you can build something similar
    with the following snippet:
    php74.override { embedSupport = true; apxs2Support = false; }
  ''; # Added 2020-04-01
  php73-embed = php-embed; # Added 2020-04-01
  php74-embed = php-embed; # Added 2020-04-01

  phpPackages-embed = throw ''
    php*Packages-embed has been dropped, you can build something
    similar with the following snippet:
    (php74.override { embedSupport = true; apxs2Support = false; }).packages
  ''; # Added 2020-04-01
  php73Packages-embed = phpPackages-embed;
  php74Packages-embed = phpPackages-embed;

  php-unit = throw ''
    php*-unit has been dropped, you can build something similar with
    the following snippet:
    php74.override {
      embedSupport = true;
      apxs2Support = false;
      systemdSupport = false;
      phpdbgSupport = false;
      cgiSupport = false;
      fpmSupport = false;
    }
  ''; # Added 2020-04-01
  php73-unit = php-unit; # Added 2020-04-01
  php74-unit = php-unit; # Added 2020-04-01

  phpPackages-unit = throw ''
    php*Packages-unit has been dropped, you can build something
     similar with this following snippet:
    (php74.override {
      embedSupport = true;
      apxs2Support = false;
      systemdSupport = false;
      phpdbgSupport = false;
      cgiSupport = false;
      fpmSupport = false;
    }).packages
  ''; # Added 2020-04-01
  php73Packages-unit = phpPackages-unit;
  php74Packages-unit = phpPackages-unit;

  pidgin-with-plugins = throw "'pidgin-with-plugins' has been renamed to/replaced by 'pidgin'"; # Converted to throw 2022-02-22
  pidginlatex = throw "'pidginlatex' has been renamed to/replaced by 'pidgin-latex'"; # Converted to throw 2022-02-22
  pidginlatexSF = throw "'pidginlatexSF' has been renamed to/replaced by 'pidgin-latex'"; # Converted to throw 2022-02-22
  pidginmsnpecan = throw "'pidginmsnpecan' has been renamed to/replaced by 'pidgin-msn-pecan'"; # Converted to throw 2022-02-22
  pidginosd = throw "'pidginosd' has been renamed to/replaced by 'pidgin-osd'"; # Converted to throw 2022-02-22
  pidginotr = throw "'pidginotr' has been renamed to/replaced by 'pidgin-otr'"; # Converted to throw 2022-02-22
  pidginsipe = throw "'pidginsipe' has been renamed to/replaced by 'pidgin-sipe'"; # Converted to throw 2022-02-22
  pidginwindowmerge = throw "'pidginwindowmerge' has been renamed to/replaced by 'pidgin-window-merge'"; # Converted to throw 2022-02-22
  pifi = throw "pifi has been removed from nixpkgs, as it is no longer developed"; # Added 2022-01-19
  ping = throw "'ping' does not build with recent valac and has been removed. If you are just looking for the 'ping' command use either 'iputils' or 'inetutils'"; # Added 2022-04-18
  pipewire-media-session = throw "pipewire-media-session is no longer maintained and has been removed. Please use Wireplumber instead.";
  piwik = throw "'piwik' has been renamed to/replaced by 'matomo'"; # Converted to throw 2022-02-22
  pixie = throw "pixie has been removed: abandoned by upstream"; # Added 2022-04-21
  pkgconfig = throw "'pkgconfig' has been renamed to/replaced by 'pkg-config'"; # Converted to throw 2023-09-10
  pkgconfigUpstream = throw "'pkgconfigUpstream' has been renamed to/replaced by 'pkg-configUpstream'"; # Converted to throw 2022-02-22
  pleroma-otp = pleroma; # Added 2021-07-10
  plexpy = throw "'plexpy' has been renamed to/replaced by 'tautulli'"; # Converted to throw 2022-02-22
  pltScheme = racket; # just to be sure
  pmdk = throw "'pmdk' is discontinued, no further support or maintenance is planned by upstream"; # Added 2023-02-06
  pmtools = throw "'pmtools' has been renamed to/replaced by 'acpica-tools'"; # Converted to throw 2022-02-22
  pocketsphinx = throw "pocketsphinx has been removed: unmaintained"; # Added 2022-04-24
  polarssl = throw "'polarssl' has been renamed to/replaced by 'mbedtls'"; # Converted to throw 2022-02-22
  polymc = throw "PolyMC has been removed from nixpkgs due to a hostile takeover by a rogue maintainer. The rest of the maintainers have made a fork which is packaged as 'prismlauncher'"; # Added 2022-10-18
  polysh = throw "polysh has been removed from nixpkgs as the upstream has abandoned the project"; # Added 2022-01-01
  pomotroid = throw "pomotroid has been removed from nixpkgs, because it depended on an insecure version of electron"; # Added 2023-09-12
  pond = throw "pond has been dropped due to the lack of maintenance from upstream since 2016"; # Added 2022-06-02
  poppler_qt5 = throw "'poppler_qt5' has been renamed to/replaced by 'libsForQt5.poppler'"; # Converted to throw 2022-02-22
  powerdns = pdns; # Added 2022-03-28
  portaudio2014 = throw "'portaudio2014' has been removed"; # Added 2022-05-10

  # postgresql
  postgresql96 = postgresql_9_6;
  postgresql_9_6 = throw "postgresql_9_6 has been removed from nixpkgs, as this version is no longer supported by upstream"; # Added 2021-12-03
  postgresql_10 = throw "postgresql_10 has been removed from nixpkgs, as this version went EOL on 2022-11-10"; # Added 2022-08-01

  # postgresql plugins
  cstore_fdw = postgresqlPackages.cstore_fdw;
  pg_cron = postgresqlPackages.pg_cron;
  pg_hll = postgresqlPackages.pg_hll;
  pg_repack = postgresqlPackages.pg_repack;
  pg_similarity = postgresqlPackages.pg_similarity;
  pg_topn = postgresqlPackages.pg_topn;
  pgjwt = postgresqlPackages.pgjwt;
  pgroonga = postgresqlPackages.pgroonga;
  pgtap = postgresqlPackages.pgtap;
  plv8 = postgresqlPackages.plv8;
  postgis = postgresqlPackages.postgis;
  tilp2 = throw "tilp2 has been removed"; # Added 2022-01-15
  timekeeper = throw "timekeeper has been removed"; # Added 2022-01-16
  timescaledb = postgresqlPackages.timescaledb;
  tlauncher = throw "tlauncher has been removed because there questionable practices and legality concerns";
  tsearch_extras = postgresqlPackages.tsearch_extras;

  pinentry_curses = throw "'pinentry_curses' has been renamed to/replaced by 'pinentry-curses'"; # Converted to throw 2023-09-10
  pinentry_emacs = throw "'pinentry_emacs' has been renamed to/replaced by 'pinentry-emacs'"; # Converted to throw 2023-09-10
  pinentry_gnome = throw "'pinentry_gnome' has been renamed to/replaced by 'pinentry-gnome'"; # Converted to throw 2023-09-10
  pinentry_gtk2 = throw "'pinentry_gtk2' has been renamed to/replaced by 'pinentry-gtk2'"; # Converted to throw 2023-09-10
  pinentry_qt = throw "'pinentry_qt' has been renamed to/replaced by 'pinentry-qt'"; # Converted to throw 2023-09-10
  pinentry_qt5 = pinentry-qt; # Added 2020-02-11
  prboom = throw "prboom was removed because it was abandoned by upstream, use prboom-plus instead"; # Added 2022-04-24
  privateer = throw "privateer was removed because it was broken"; # Added 2021-05-18
  probe-rs-cli = throw "probe-rs-cli is now part of the probe-rs package"; # Added 2023-07-03
  processing3 = throw "'processing3' has been renamed to/replaced by 'processing'"; # Converted to throw 2023-09-10
  procps-ng = throw "'procps-ng' has been renamed to/replaced by 'procps'"; # Converted to throw 2022-02-22
  proglodyte-wasm = throw "proglodyte-wasm has been removed from nixpkgs, because it is unmaintained since 5 years with zero github stars"; # Added 2021-06-30
  proj_5 = throw "Proj-5 has been removed from nixpkgs, use proj instead"; # Added 2021-04-12
  prometheus-cups-exporter = throw "outdated and broken by design; removed by developer"; # Added 2021-03-16
  prometheus-dmarc-exporter = dmarc-metrics-exporter; # added 2022-05-31
  prometheus-mesos-exporter = throw "prometheus-mesos-exporter is deprecated and archived by upstream"; # Added 2022-04-05
  prometheus-unifi-exporter = throw "prometheus-unifi-exporter is deprecated and archived by upstream, use unifi-poller instead"; # Added 2022-06-03
  prometheus-speedtest-exporter = throw "prometheus-speedtest-exporter was removed as unmaintained"; # Added 2023-07-31
  protobuf3_7 = throw "protobuf3_7 does not receive updates anymore and has been removed"; # Added 2022-10-03
  protobuf3_11 = throw "protobuf3_11 does not receive updates anymore and has been removed"; # Added 2022-09-28
  protobuf3_17 = throw "protobuf3_17 does not receive updates anymore and has been removed"; # Added 2023-05-21
  protonup = protonup-ng; # Added 2022-11-06
  proxmark3-rrg = proxmark3; # Added 2023-07-25
  proxmark3-unstable = throw "removed in favor of rfidresearchgroup fork"; # Added 2023-07-25
  proxytunnel = throw "proxytunnel has been removed from nixpkgs, because it has not been update upstream since it was added to nixpkgs in 2008 and has therefore bitrotted."; # added 2021-12-15
  pulseaudio-hsphfpd = throw "pulseaudio-hsphfpd upstream has been abandoned"; # Added 2022-03-23
  pulseaudio-modules-bt = throw "pulseaudio-modules-bt has been abandoned, and is superseded by pulseaudio's native bt functionality"; # Added 2022-04-01
  pulseaudioLight = throw "'pulseaudioLight' has been renamed to/replaced by 'pulseaudio'"; # Converted to throw 2022-02-22
  pulseeffects = throw "Use pulseeffects-legacy if you use PulseAudio and easyeffects if you use PipeWire"; # Added 2021-02-13
  pulseeffects-pw = easyeffects; # Added 2021-07-07
  pyls-black = throw "pyls-black has been removed from nixpkgs. Use python-lsp-black instead."; # Added 2023-01-09
  pyls-mypy = throw "pyls-mypy has been removed from nixpkgs. Use pylsp-mypy instead."; # Added 2023-01-09
  py-wmi-client = throw "py-wmi-client has been removed: abandoned by upstream"; # Added 2022-04-26
  pydb = throw "pydb has been removed: abandoned by upstream"; # Added 2022-04-22
  pyIRCt = throw "pyIRCt has been removed from nixpkgs as it is unmaintained and python2-only";
  pyMAILt = throw "pyMAILt has been removed from nixpkgs as it is unmaintained and python2-only";
  pybind11 = throw "pybind11 was removed because pythonPackages.pybind11 for the appropriate version of Python should be used"; # Added 2021-05-14
  pybitmessage = throw "pybitmessage was removed from nixpkgs as it is stuck on python2"; # Added 2022-01-01
  pyext = throw "pyext was removed because it does not support python 3.11, is upstream unmaintained and was unused"; # Added 2022-11-21
  pygmentex = throw "'pygmentex' has been renamed to/replaced by 'texlive.bin.pygmentex'"; # Converted to throw 2023-09-10
  pyload = throw "pyload has been removed from nixpkgs. Use pyload-ng instead."; # Added 2021-03-21
  pynagsystemd = throw "pynagsystemd was removed as it was unmaintained and incompatible with recent systemd versions. Instead use its fork check_systemd"; # Added 2020-10-24
  pyo3-pack = maturin;
  pypi2nix = throw "pypi2nix has been removed due to being unmaintained";
  pypolicyd-spf = spf-engine; # Added 2022-10-09
  pyrex = throw "pyrex has been removed from nixpkgs as the project is still stuck on python2"; # Added 2022-01-12
  pyrex095 = throw "pyrex has been removed from nixpkgs as the project is still stuck on python2"; # Added 2022-01-12
  pyrex096 = throw "pyrex has been removed from nixpkgs as the project is still stuck on python2"; # Added 2022-01-12
  pyrit = throw "pyrit has been removed from nixpkgs as the project is still stuck on python2"; # Added 2022-01-01
  python = python2; # Added 2022-01-11
  python-language-server = throw "python-language-server has been removed as it is no longer maintained. Use e.g. python-lsp-server instead"; # Added 2023-01-07
  python-swiftclient = swiftclient; # Added 2021-09-09
  python2nix = throw "python2nix has been removed as it is outdated. Use e.g. nixpkgs-pytools instead"; # Added 2021-03-08
  pythonFull = python2Full; # Added 2022-01-11
  pythonPackages = python.pkgs; # Added 2022-01-11

  ### Q ###

  QmidiNet = throw "'QmidiNet' has been renamed to/replaced by 'qmidinet'"; # Converted to throw 2022-02-22
  qca-qt5 = throw "'qca-qt5' has been renamed to/replaced by 'libsForQt5.qca-qt5'"; # Converted to throw 2022-02-22
  qca2 = throw "qca2 has been removed, because it depended on qt4"; # Added 2022-05-26
  qcsxcad = libsForQt5.qcsxcad; # Added 2020-11-05
  qtcreator-qt6 = throw "'qtcreator-qt6' has been renamed to/replaced by 'qtcreator', since qt5 version has been removed"; # Added 2023-07-25
  qflipper = qFlipper; # Added 2022-02-11
  qfsm = throw "qfsm has been removed, because it depended on qt4"; # Added 2022-06-12
  qimageblitz = throw "qimageblitz has been removed from nixpkgs, because it depended on qt4 and was last updated upstream in 2007"; # Added 2022-06-12
  qmetro = throw "qmetro has been removed, because it does not support qt5 (well)"; # Added 2022-05-26
  qmidiroute = throw "qmidiroute has been removed, because it was unmaintained upstream"; # Added 2022-05-26
  qmk_firmware = throw "qmk_firmware has been removed because it was broken"; # Added 2021-04-02
  qlandkartegt = throw "'qlandkartegt' has been removed from nixpkgs, as it was broken and unmaintained"; # Added 2023-04-17
  qr-filetransfer = throw ''"qr-filetransfer" has been renamed to "qrcp"''; # Added 2020-12-02
  qshowdiff = throw "'qshowdiff' (Qt4) is unmaintained and not been updated since its addition in 2010"; # Added 2022-06-14
  qtscrobbler = throw "qtscrobbler has been removed, because it was unmaintained"; # Added 2022-05-26
  qt-3 = throw "qt-3 has been removed from nixpkgs, as it's unmaintained and insecure"; # Added 2021-02-15
  qt512 = throw "Qt 5 versions prior to 5.15 are no longer supported upstream and have been removed";  # Added 2022-11-24
  qt514 = throw "Qt 5 versions prior to 5.15 are no longer supported upstream and have been removed";  # Added 2022-11-24
  qt515 = qt5;  # Added 2022-11-24
  qt4 = throw "qt4 has been removed from nixpkgs, because it's been EOL since the end of 2015"; # Added 2022-05-09
  qt5ct = libsForQt5.qt5ct; # Added 2021-12-27
  qt6ct = qt6Packages.qt6ct; # Added 2023-03-07
  qtcurve = libsForQt5.qtcurve; # Added 2020-11-07
  qtile-unwrapped = python3.pkgs.qtile; # Added 2023-05-12
  qtkeychain = throw "the qtkeychain attribute (qt4 version) has been removes, use the qt5 version: libsForQt5.qtkeychain"; # Added 2021-08-04
  qt-mobility = throw "qt-mobility has been removed, because it depended on qt4"; # Added 2022-06-13
  qtscriptgenerator = throw "'qtscriptgenerator' (Qt4) is unmaintained upstream and not used in nixpkgs"; # Added 2022-06-14
  qtstyleplugin-kvantum-qt4 = throw "qtstyleplugin-kvantum-qt4 has been removed, because it depended on qt4"; # Added 2022-05-26
  quagga = throw "quagga is no longer maintained upstream"; # Added 2021-04-22
  quake3game = throw "'quake3game' has been renamed to/replaced by 'ioquake3'"; # Converted to throw 2022-02-22
  quaternion-git = throw "quaternion-git has been removed in favor of the stable version 'quaternion'"; # Added 2020-04-09
  qucs = throw "qucs has been removed, because it depended on qt4. try using qucs-s"; # Added 2022-05-12
  quilter = throw "quilter has been removed from nixpkgs, as it was unmaintained"; # Added 2021-08-03
  qutebrowser-qt6 = throw "'qutebrowser-qt6' has been replaced by 'qutebrowser', since the the qt5 version has been removed"; # Added 2023-08-19
  qvim = throw "qvim has been removed"; # Added 2020-08-31
  qweechat = throw "qweechat has been removed because it was broken"; # Added 2021-03-08
  qwt6 = throw "'qwt6' has been renamed to/replaced by 'libsForQt5.qwt'"; # Converted to throw 2022-02-22

  ### R ###

  radare2-cutter = cutter; # Added 2021-03-30
  railcar = throw "'railcar' has been removed, as the upstream project has been abandoned"; # Added 2022-06-27
  rambox-pro = rambox; # Added 2022-12-12
  rarian = throw "rarian has been removed as unused"; # Added 2023-07-05
  raspberrypi-tools = throw "raspberrypi-tools has been removed in favor of identical 'libraspberrypi'"; # Added 2020-12-24
  rawdog = throw "rawdog has been removed from nixpkgs as it still requires python2"; # Added 2022-01-01
  rdiff_backup = throw "'rdiff_backup' has been renamed to/replaced by 'rdiff-backup'"; # Converted to throw 2022-02-22
  rdmd = throw "'rdmd' has been renamed to/replaced by 'dtools'"; # Converted to throw 2022-02-22
  readline5 = throw "readline-5 is no longer supported in nixpkgs, please use 'readline' for main supported version"; # Added 2022-02-20
  readline62 = throw "readline-6.2 is no longer supported in nixpkgs, please use 'readline' for main supported version"; # Added 2022-02-20
  readline80 = throw "readline-8.0 is no longer supported in nixpkgs, please use 'readline' for main supported version"; # Added 2021-04-22
  redkite = throw "redkite was archived by upstream"; # Added 2021-04-12
  redis-desktop-manager = throw "'redis-desktop-manager' has been renamed to/replaced by 'resp-app'"; # Added 2022-11-10
  redshift-wlr = throw "redshift-wlr has been replaced by gammastep"; # Added 2021-12-25
  resim = throw "resim has been removed, because it depended on qt4"; # Added 2022-05-26
  reicast = throw "reicast has been removed from nixpkgs as it is unmaintained, please use flycast instead"; # Added 2022-03-07
  residualvm = throw "residualvm was merged to scummvm code in 2018-06-15; consider using scummvm"; # Added 2021-11-27
  retroArchCores = throw "retroArchCores has been removed. Please use overrides instead, e.g.: `retroarch.override { cores = with libretro; [ ... ]; }`"; # Added 2021-11-19
  retroshare06 = retroshare;
  rfkill = throw "rfkill has been removed, as it's included in util-linux"; # Added 2020-08-23
  riak = throw "riak has been removed due to lack of maintainer to update the package"; # Added 2022-06-22
  riak-cs = throw "riak-cs is not maintained anymore"; # Added 2020-10-14
  rigsofrods = rigsofrods-bin; # Added 2023-03-22
  rimshot = throw "rimshot has been removed, because it is broken and no longer maintained upstream"; # Added 2022-01-15
  ring-daemon = jami-daemon; # Added 2021-10-26
  rkt = throw "rkt was archived by upstream"; # Added 2020-05-16
  rls = throw "rls was discontinued upstream, use rust-analyzer instead"; # Added 2022-09-06
  rng_tools = throw "'rng_tools' has been renamed to/replaced by 'rng-tools'"; # Converted to throw 2022-02-22
  robomongo = throw "'robomongo' has been renamed to/replaced by 'robo3t'"; # Converted to throw 2022-02-22
  rockbox_utility = rockbox-utility; # Added 2022-03-17
  rocm-runtime-ext = throw "rocm-runtime-ext has been removed, since its functionality was added to rocm-runtime"; #added 2020-08-21
  rpiboot-unstable = rpiboot; # Added 2021-07-30
  rr-unstable = rr; # Added 2022-09-17
  rssglx = throw "'rssglx' has been renamed to/replaced by 'rss-glx'"; # Converted to throw 2022-02-22
  rssh = throw "rssh has been removed from nixpkgs: no upstream releases since 2012, several known CVEs"; # Added 2020-08-25
  rtl8723bs-firmware = throw "rtl8723bs-firmware was added in mainline kernel version 4.12"; # Added 2023-07-03
  rtv = throw "rtv was archived by upstream. Consider using tuir, an actively maintained fork"; # Added 2021-08-08
  rtsp-simple-server = throw "rtsp-simple-server is rebranded as mediamtx, including default config path update"; # Added 2023-04-11
  rubyMinimal = throw "rubyMinimal was removed due to being unused";
  runCommandNoCC = runCommand;
  runCommandNoCCLocal = runCommandLocal;
  runwayml = throw "runwayml is now a webapp"; # Added 2021-04-17
  rustracerd = throw "rustracerd has been removed because it is broken and unmaintained"; # Added 2021-10-19
  rustracer = throw "rustracer has been removed as it has been deprecated"; # Added 2022-11-28
  rxvt_unicode = rxvt-unicode-unwrapped; # Added 2020-02-02
  rxvt_unicode-with-plugins = rxvt-unicode; # Added 2020-02-02

  # The alias for linuxPackages*.rtlwifi_new is defined in ./all-packages.nix,
  # due to it being inside the linuxPackagesFor function.
  rtlwifi_new-firmware = rtw88-firmware; # Added 2021-03-14
  rtw89-firmware = throw "rtw89-firmware has been removed because linux-firmware now contains it."; # Added 2023-02-19

  ### S ###

  s2n = s2n-tls; # Added 2021-03-03
  s3gof3r = throw "s3gof3r has been dropped due to the lack of maintenance from upstream since 2017"; # Added 2022-06-04
  s6Dns = throw "'s6Dns' has been renamed to/replaced by 's6-dns'"; # Converted to throw 2022-02-22
  s6LinuxUtils = throw "'s6LinuxUtils' has been renamed to/replaced by 's6-linux-utils'"; # Converted to throw 2022-02-22
  s6Networking = throw "'s6Networking' has been renamed to/replaced by 's6-networking'"; # Converted to throw 2022-02-22
  s6PortableUtils = throw "'s6PortableUtils' has been renamed to/replaced by 's6-portable-utils'"; # Converted to throw 2022-02-22
  sagemath = throw "'sagemath' has been renamed to/replaced by 'sage'"; # Converted to throw 2022-02-22
  salut_a_toi = throw "salut_a_toi was removed because it was broken and used Python 2"; # added 2022-06-05
  sam = throw "'sam' has been renamed to/replaced by 'deadpixi-sam'"; # Converted to throw 2022-02-22
  samsungUnifiedLinuxDriver = throw "'samsungUnifiedLinuxDriver' has been renamed to/replaced by 'samsung-unified-linux-driver'"; # Converted to throw 2022-02-22
  sane-backends-git = sane-backends; # Added 2021-02-19
  saneBackends = throw "'saneBackends' has been renamed to/replaced by 'sane-backends'"; # Converted to throw 2022-02-22
  saneBackendsGit = throw "'saneBackendsGit' has been renamed to/replaced by 'sane-backends'"; # Converted to throw 2022-02-22
  saneFrontends = throw "'saneFrontends' has been renamed to/replaced by 'sane-frontends'"; # Converted to throw 2022-02-22
  scaff = throw "scaff is deprecated - replaced by https://gitlab.com/jD91mZM2/inc (not in nixpkgs yet)"; # Added 2020-03-01
  scallion = throw "scallion has been removed, because it is currently unmaintained upstream"; # added 2021-12-15
  scantailor = scantailor-advanced; # Added 2022-05-26
  scim = throw "'scim' has been renamed to/replaced by 'sc-im'"; # Converted to throw 2022-02-22
  scollector = throw "'scollector' has been renamed to/replaced by 'bosun'"; # Converted to throw 2022-02-22
  screencloud = throw "screencloud has been removed, because it was unmaintained in nixpkgs"; # Added 2022-05-26
  scribus_1_4 = throw "scribus has been removed, because it is based on EOL technologies, e.g. qt4 and python2"; # Added 2022-05-29
  scribusUnstable = throw "'scribusUnstable' has been renamed to 'scribus'"; # Added 2022-05-13
  scrollkeeper = throw "'scrollkeeper' has been removed due to deprecated LibXML2 headers"; # Added 2022-11-08
  scyther = throw "scyther has been removed since it currently only supports Python 2, see https://github.com/cascremers/scyther/issues/20"; # Added 2021-10-07
  sdlmame = throw "'sdlmame' has been renamed to/replaced by 'mame'"; # Converted to throw 2023-09-10
  seeks = throw "seeks has been removed from nixpkgs, as it was unmaintained"; # Added 2020-06-21
  sepolgen = throw "sepolgen was merged into selinux-python"; # Added 2021-11-11
  session-desktop-appimage = session-desktop;
  sequoia = sequoia-sq; # Added 2023-06-26
  sexp = sexpp; # Added 2023-07-03
  sget = throw "sget has been removed from nixpkgs, as it is not supported upstream anymore see https://github.com/sigstore/sget/issues/145"; # Added 2023-05-26
  shared_mime_info = throw "'shared_mime_info' has been renamed to/replaced by 'shared-mime-info'"; # Converted to throw 2022-02-22
  inherit (libsForQt5.mauiPackages) shelf; # added 2022-05-17
  shellinabox = throw "shellinabox has been removed from nixpkgs, as it was unmaintained upstream"; # Added 2021-12-15
  shhgit = throw "shhgit is broken and is no longer maintained. See https://github.com/eth0izzle/shhgit#-shhgit-is-no-longer-maintained-" ; # Added 2023-08-08
  shipyard = jumppad; # Added 2023-06-06
  sickbeard = throw "sickbeard has been removed from nixpkgs, as it was unmaintained"; # Added 2022-01-01
  sickrage = throw "sickbeard has been removed from nixpkgs, as it was unmaintained"; # Added 2022-01-01
  signumone-ks = throw "signumone-ks has been removed from nixpkgs because the developers stopped offering the binaries"; # Added 2023-08-17
  sigurlx = throw "sigurlx has been removed (upstream is gone)"; # Added 2022-01-24
  skrooge2 = throw "'skrooge2' has been renamed to/replaced by 'skrooge'"; # Converted to throw 2022-02-22
  skype = throw "'skype' has been renamed to/replaced by 'skypeforlinux'"; # Converted to throw 2022-02-22
  skype4pidgin = throw "skype4pidgin has been remove from nixpkgs, because it stopped working when classic Skype was retired"; # Added 2021-07-14
  skype_call_recorder = throw "skype_call_recorder has been removed from nixpkgs, because it stopped working when classic Skype was retired"; # Added 2020-10-31
  slack-dark = slack; # Added 2020-03-27
  sleepyhead = throw "'sleepyhead' has been renamed to/replaced by 'OSCAR'"; # Added 2022-11-20
  slic3r-prusa3d = throw "'slic3r-prusa3d' has been renamed to/replaced by 'prusa-slicer'"; # Converted to throw 2022-02-22
  slmenu = throw "slmenu has been removed (upstream is gone)"; # Added 2023-04-06
  slurm-full = throw "'slurm-full' has been renamed to/replaced by 'slurm'"; # Converted to throw 2022-02-22
  slurm-llnl = slurm; # renamed July 2017
  slurm-llnl-full = slurm-full; # renamed July 2017
  smbclient = throw "'smbclient' has been renamed to/replaced by 'samba'"; # Converted to throw 2022-02-22
  smugline = throw "smugline has been removed from nixpkgs, as it's unmaintained and depends on deprecated libraries"; # Added 2020-11-04
  snack = throw "snack has been removed: broken for 5+ years"; # Added 2022-04-21
  soldat-unstable = opensoldat; # Added 2022-07-02
  solr_8 = throw "'solr' has been removed from nixpkgs, as it was broken and unmaintained"; # Added 2023-03-16
  solr = throw "'solr' has been removed from nixpkgs, as it was broken and unmaintained"; # Added 2023-03-16
  soundOfSorting = sound-of-sorting; # Added 2023-07-07
  spark2 = throw "'spark2' is no longer supported nixpkgs, please use 'spark'"; # Added 2023-05-08
  spark_2_4 = throw "'spark_2_4' is no longer supported nixpkgs, please use 'spark'"; # Added 2023-05-08
  spark_3_1 = throw "'spark_3_1' is no longer supported nixpkgs, please use 'spark'"; # Added 2023-05-08

  # Added 2020-02-10
  sourceHanSansPackages = {
    japanese = source-han-sans;
    korean = source-han-sans;
    simplified-chinese = source-han-sans;
    traditional-chinese = source-han-sans;
  };
  source-han-sans-japanese = source-han-sans;
  source-han-sans-korean = source-han-sans;
  source-han-sans-simplified-chinese = source-han-sans;
  source-han-sans-traditional-chinese = source-han-sans;
  sourceHanSerifPackages = {
    japanese = source-han-serif;
    korean = source-han-serif;
    simplified-chinese = source-han-serif;
    traditional-chinese = source-han-serif;
  };
  source-han-serif-japanese = source-han-serif;
  source-han-serif-korean = source-han-serif;
  source-han-serif-simplified-chinese = source-han-serif;
  source-han-serif-traditional-chinese = source-han-serif;

  sourcetrail = throw "sourcetrail has been removed: abandoned by upstream"; # Added 2022-08-14

  spacegun = throw "'spacegun' has been removed as unmaintained"; # Added 2023-05-20
  spaceOrbit = throw "'spaceOrbit' has been renamed to/replaced by 'space-orbit'"; # Converted to throw 2022-02-22
  spectral = neochat; # Added 2020-12-27
  speech_tools = throw "'speech_tools' has been renamed to/replaced by 'speech-tools'"; # Converted to throw 2022-02-22
  speedometer = throw "speedometer has been removed: abandoned by upstream"; # Added 2022-04-24
  speedtest_cli = throw "'speedtest_cli' has been renamed to/replaced by 'speedtest-cli'"; # Converted to throw 2022-02-22
  speedtest-exporter = throw "'speedtest-exporter' has been removed as unmaintained"; # Added 2023-07-31
  sphinxbase = throw "sphinxbase has been removed: unmaintained"; # Added 2022-04-24
  spice-gtk_libsoup2 = throw "'spice-gtk_libsoup2' has been renamed to/replaced by 'spice-gtk'"; # Added 2023-02-21
  spice_gtk = throw "'spice_gtk' has been renamed to/replaced by 'spice-gtk'"; # Converted to throw 2022-02-22
  spice_protocol = throw "'spice_protocol' has been renamed to/replaced by 'spice-protocol'"; # Converted to throw 2022-02-22
  spidermonkey_1_8_5 = throw "spidermonkey_1_8_5 has been removed, because it is based on Firefox 4.0 from 2011"; # added 2021-05-03
  spidermonkey_38 = throw "spidermonkey_38 has been removed. Please use spidermonkey_78 instead"; # Added 2021-03-21
  spidermonkey_60 = throw "spidermonkey_60 has been removed. Please use spidermonkey_78 instead"; # Added 2021-03-21
  spidermonkey_68 = throw "spidermonkey_68 has been removed. Please use spidermonkey_91 instead"; # added 2022-01-04
  # spidermonkey is not ABI upwards-compatible, so only allow this for nix-shell
  spidermonkey = spidermonkey_78; # Added 2020-10-09
  split2flac = throw "split2flac has been removed. Consider using the shnsplit command from shntool package or help packaging unflac."; # added 2022-01-13
  spotify-unwrapped = spotify; # added 2022-11-06
  spring-boot = spring-boot-cli; # added 2020-04-24
  sqlite3_analyzer = throw "'sqlite3_analyzer' has been renamed to/replaced by 'sqlite-analyzer'"; # Converted to throw 2022-02-22
  sqlite-replication = throw "'sqlite-replication' has been removed since it is no longer required by lxd and is not maintained."; # throw 2022-12-26
  sqliteInteractive = throw "'sqliteInteractive' has been renamed to/replaced by 'sqlite-interactive'"; # Converted to throw 2022-02-22
  sqliteman = throw "sqliteman has been removed, because it was unmaintained"; # Added 2022-05-26
  squid4 = throw "'squid4' has been renamed to/replaced by 'squid'"; # Converted to throw 2023-09-10
  srcml = throw "'srcml' has been removed: abandoned by upstream"; # Added 2022-07-21
  sshfsFuse = throw "'sshfsFuse' has been renamed to/replaced by 'sshfs-fuse'"; # Converted to throw 2022-02-22
  ssmtp = throw "'ssmtp' has been removed due to the software being unmaintained. 'msmtp' can be used as a replacement"; # Added 2022-04-17
  ssr = throw "ssr has been removed, because it was unmaintained in nixpkgs and depended on qt4"; # Added 2022-05-26
  stanchion = throw "Stanchion was part of riak-cs which is not maintained anymore"; # added 2020-10-14
  steam-run-native = steam-run; # added 2022-02-21
  stride = throw "'stride' aka. Atlassian Stride is dead since 2019 (bought by Slack)"; # added 2022-06-15
  structure-synth = throw "structure-synth has been removed, because it was unmaintained"; # Added 2022-05-09
  stumpwm-git = throw "stumpwm-git has been broken for a long time and lispPackages.stumpwm follows Quicklisp that is close to git version"; # Added 2021-05-09
  subversion_1_10 = throw "subversion_1_10 has been removed as it has reached its end of life"; # Added 2022-04-26
  subversion19 = throw "subversion19 has been removed as it has reached its end of life"; # Added 2021-03-31
  sudolikeaboss = throw "sudolikeaboss is no longer maintained by upstream"; # Added 2022-04-16
  sumneko-lua-language-server = lua-language-server; # Added 2023-02-07
  sundials_3 = throw "sundials_3 was removed in 2020-02. outdated and no longer needed";
  surf-webkit2 = throw "'surf-webkit2' has been renamed to/replaced by 'surf'"; # Converted to throw 2022-02-22
  swec = throw "swec has been removed; broken and abandoned upstream"; # Added 2021-10-14
  sweep-visualizer = throw "'sweep-visualizer' is abondoned upstream and depends on deprecated GNOME2/GTK2"; # Added 2022-06-15
  swift-im = throw "swift-im has been removed as it is unmaintained and depends on deprecated Python 2 / Qt WebKit"; # Added 2023-01-06
  swfdec = throw "swfdec has been removed as broken and unmaintained"; # Added 2020-08-23
  swtpm-tpm2 = swtpm; # Added 2021-02-26
  syncthing-cli = syncthing; # Added 2021-04-06
  synology-drive = throw "synology-drive has been superseded by synology-drive-client"; # Added 2021-11-26
  system_config_printer = throw "'system_config_printer' has been renamed to/replaced by 'system-config-printer'"; # Converted to throw 2022-02-22
  systemd-cryptsetup-generator = throw "systemd-cryptsetup-generator is now included in the systemd package"; # Added 2020-07-12
  systemd_with_lvm2 = throw "systemd_with_lvm2 is obsolete, enabled by default via the lvm module"; # Added 2020-07-12
  systool = throw "'systool' has been renamed to/replaced by 'sysfsutils'"; # Converted to throw 2022-02-22

  ### T ###

  tahoelafs = throw "'tahoelafs' has been renamed to/replaced by 'tahoe-lafs'"; # Converted to throw 2022-02-22
  tangogps = foxtrotgps; # Added 2020-01-26
  taplo-cli = taplo; # Added 2022-07-30
  taplo-lsp = taplo; # Added 2022-07-30
  taro = taproot-assets; # Added 2023-07-04
  tdesktop = telegram-desktop; # Added 2023-04-07
  tdm = throw "tdm has been removed because nobody can figure out how to fix OpenAL integration. Use precompiled binary and `steam-run` instead";
  teleconsole = throw "teleconsole is archived by upstream"; # Added 2022-04-05
  telegram-cli = throw "telegram-cli was removed because it was broken and abandoned upstream"; # Added 2023-07-28
  telepathy-qt = throw "telepathy-qt no longer supports Qt 4. Please use libsForQt5.telepathy instead"; # Added 2020-07-02
  telepathy_farstream = throw "'telepathy_farstream' has been renamed to/replaced by 'telepathy-farstream'"; # Converted to throw 2022-02-22
  telepathy_gabble = throw "'telepathy_gabble' has been renamed to/replaced by 'telepathy-gabble'"; # Converted to throw 2022-02-22
  telepathy_glib = throw "'telepathy_glib' has been renamed to/replaced by 'telepathy-glib'"; # Converted to throw 2022-02-22
  telepathy_haze = throw "'telepathy_haze' has been renamed to/replaced by 'telepathy-haze'"; # Converted to throw 2022-02-22
  telepathy_idle = throw "'telepathy_idle' has been renamed to/replaced by 'telepathy-idle'"; # Converted to throw 2022-02-22
  telepathy_logger = throw "'telepathy_logger' has been renamed to/replaced by 'telepathy-logger'"; # Converted to throw 2022-02-22
  telepathy_mission_control = throw "'telepathy_mission_control' has been renamed to/replaced by 'telepathy-mission-control'"; # Converted to throw 2022-02-22
  telepathy_qt = throw "'telepathy_qt' has been renamed to/replaced by 'telepathy-qt'"; # Converted to throw 2022-02-22
  telepathy_qt5 = throw "'telepathy_qt5' has been renamed to/replaced by 'libsForQt5.telepathy'"; # Converted to throw 2022-02-22
  telnet = throw "'telnet' has been renamed to/replaced by 'inetutils'"; # Converted to throw 2022-02-22
  terminus = throw "terminus has been removed, it was unmaintained in nixpkgs"; # Added 2021-08-21
  termonad-with-packages = throw "termonad-with-packages has been renamed to just 'termonad'"; # Added 2022-10-15
  terraform-full = throw "terraform-full has been removed, it was an alias for 'terraform.full'"; # Added 2022-08-02
  terraform_0_13 = throw "terraform_0_13 has been removed from nixpkgs"; # Added 2022-06-26
  terraform_0_14 = throw "terraform_0_14 has been removed from nixpkgs"; # Added 2022-06-26
  terraform_0_15 = throw "terraform_0_15 has been removed from nixpkgs"; # Added 2022-06-26
  tesseract_4 = throw "'tesseract_4' has been renamed to/replaced by 'tesseract4'"; # Converted to throw 2022-02-22
  testVersion = testers.testVersion; # Added 2022-04-20
  invalidateFetcherByDrvHash = testers.invalidateFetcherByDrvHash; # Added 2022-05-05
  tex-gyre-bonum-math = throw "'tex-gyre-bonum-math' has been renamed to/replaced by 'tex-gyre-math.bonum'"; # Converted to throw 2022-02-22
  tex-gyre-pagella-math = throw "'tex-gyre-pagella-math' has been renamed to/replaced by 'tex-gyre-math.pagella'"; # Converted to throw 2022-02-22
  tex-gyre-schola-math = throw "'tex-gyre-schola-math' has been renamed to/replaced by 'tex-gyre-math.schola'"; # Converted to throw 2022-02-22
  tex-gyre-termes-math = throw "'tex-gyre-termes-math' has been renamed to/replaced by 'tex-gyre-math.termes'"; # Converted to throw 2022-02-22
  textadept11 = throw "textadept11 has been removed. Please use textadept instead"; # Added 2022-12-23 TODO: UPDATE THE DATE
  tftp_hpa = throw "'tftp_hpa' has been renamed to/replaced by 'tftp-hpa'"; # Converted to throw 2022-02-22
  thunderbird-68 = throw "Thunderbird 68 reached end of life with its final release 68.12.0 on 2020-08-25";
  thunderbird-bin-68 = thunderbird-68;
  thunderbird-wayland = thunderbird; # Added 2022-11-15
  timescale-prometheus = promscale; # Added 2020-09-29
  timedoctor = throw "'timedoctor' has been removed from nixpkgs"; # Added 2022-10-09
  timetable = throw "timetable has been removed, as the upstream project has been abandoned"; # Added 2021-09-05
  tinygltf = throw "TinyglTF has been embedded in draco due to lack of other users and compatibility breaks."; # Added 2023-06-25
  tixati = throw "'tixati' has been removed from nixpkgs as it is unfree and unmaintained"; # Added 2023-03-17
  tkcvs = tkrev; # Added 2022-03-07
  togglesg-download = throw "togglesg-download was removed 2021-04-30 as it's unmaintained"; # Added 2021-04-30
  tokodon = plasma5Packages.tokodon;
  tomboy = throw "tomboy is not actively developed anymore and was removed"; # Added 2022-01-27
  tomcat7 = throw "tomcat7 has been removed from nixpkgs as it has reached end of life"; # Added 2021-06-16
  tomcat8 = throw "tomcat8 has been removed from nixpkgs as it has reached end of life"; # Added 2021-06-16
  tomcat85 = throw "tomcat85 has been removed from nixpkgs as it has reached end of life"; # Added 2020-03-11
  tor-arm = throw "tor-arm has been removed from nixpkgs as the upstream project has been abandoned"; # Added 2022-01-01
  torbrowser = throw "'torbrowser' has been renamed to/replaced by 'tor-browser-bundle-bin'"; # Converted to throw 2022-02-22
  torch = throw "torch has been removed, as the upstream project has been abandoned"; # Added 2020-03-28
  torch-hdf5 = throw "torch-hdf5 has been removed, as the upstream project has been abandoned"; # Added 2020-03-28
  torch-repl = throw "torch-repl has been removed, as the upstream project has been abandoned"; # Added 2020-03-28
  torchPackages = throw "torchPackages has been removed, as the upstream project has been abandoned"; # Added 2020-03-28
  trang = throw "'trang' has been renamed to/replaced by 'jing-trang'"; # Converted to throw 2022-02-22
  transfig = fig2dev; # Added 2022-02-15
  transmission-remote-cli = throw "transmission-remote-cli has been removed, as the upstream project has been abandoned. Please use tremc instead"; # Added 2020-10-14
  transmission_gtk = throw "'transmission_gtk' has been renamed to/replaced by 'transmission-gtk'"; # Converted to throw 2022-02-22
  transmission_remote_gtk = throw "'transmission_remote_gtk' has been renamed to/replaced by 'transmission-remote-gtk'"; # Converted to throw 2022-02-22
  transporter = throw "transporter has been removed. It was archived upstream, so it's considered abandoned";
  trebleshot = throw "trebleshot has been removed. It was archived upstream, so it's considered abandoned";
  trilium = throw "trilium has been removed. Please use trilium-desktop instead"; # Added 2020-04-29
  truecrypt = throw "'truecrypt' has been renamed to/replaced by 'veracrypt'"; # Converted to throw 2022-02-22
  trustedGrub = throw "trustedGrub has been removed, because it is not maintained upstream anymore"; # Added 2023-05-10
  trustedGrub-for-HP = throw "trustedGrub-for-HP has been removed, because it is not maintained upstream anymore"; # Added 2023-05-10
  tuijam = throw "tuijam has been removed because Google Play Music was discontinued"; # Added 2021-03-07
  turbo-geth = throw "turbo-geth has been renamed to erigon"; # Added 2021-08-08
  tvbrowser-bin = tvbrowser; # Added 2023-03-02
  twister = throw "twister has been removed: abandoned by upstream and python2-only"; # Added 2022-04-26
  tworld2 = throw "tworld2 has been removed, as it was unmaintained"; # Added 2022-05-09
  tychus = throw "tychus has been dropped due to the lack of maintenance from upstream since 2018"; # Added 2022-06-03
  typora = throw "Newer versions of typora use anti-user encryption and refuse to start. As such it has been removed"; # Added 2021-09-11
  typst-fmt = typstfmt; # Added 2023-07-15

  ### U ###

  uade123 = uade; # Added 2022-07-30
  uberwriter = apostrophe; # Added 2020-04-23
  ubootBeagleboneBlack = ubootAmx335xEVM; # Added 2020-01-21
  uchiwa = throw "uchiwa is deprecated and archived by upstream"; # Added 2022-05-02
  ucsFonts = throw "'ucsFonts' has been renamed to/replaced by 'ucs-fonts'"; # Converted to throw 2022-02-22
  ufraw = throw "ufraw is unmaintained and has been removed from nixpkgs. Its successor, nufraw, doesn't seem to be stable enough. Consider using Darktable for now"; # Added 2020-01-11
  uhhyou.lv2 = throw "'uhhyou.lv2' has been removed, upstream gone"; # Added 2023-06-21
  ultrastardx-beta = throw "'ultrastardx-beta' has been renamed to/replaced by 'ultrastardx'"; # Converted to throw 2022-02-22
  unicorn-emu = unicorn; # Added 2020-10-29
  uniffi-bindgen = throw "uniffi-bindgen has been removed since upstream no longer provides a standalone package for the CLI";
  unifi-poller = unpoller; # Added 2022-11-24
  unifiStable = unifi6; # Added 2020-12-28
  unity3d = throw "'unity3d' is unmaintained, has seen no updates in years and depends on deprecated GTK2"; # Added 2022-06-16
  untrunc = untrunc-anthwlock; # Added 2021-02-01
  urxvt_autocomplete_all_the_things = rxvt-unicode-plugins.autocomplete-all-the-things; # Added 2020-02-02
  urxvt_bidi = rxvt-unicode-plugins.bidi; # Added 2020-02-02
  urxvt_font_size = rxvt-unicode-plugins.font-size; # Added 2020-02-02
  urxvt_perl = rxvt-unicode-plugins.perl; # Added 2020-02-02
  urxvt_perls = rxvt-unicode-plugins.perls; # Added 2020-02-02
  urxvt_tabbedex = rxvt-unicode-plugins.tabbedex; # Added 2020-02-02
  urxvt_theme_switch = rxvt-unicode-plugins.theme-switch; # Added 2020-02-02
  urxvt_vtwheel = rxvt-unicode-plugins.vtwheel; # Added 2020-02-02
  usb_modeswitch = throw "'usb_modeswitch' has been renamed to/replaced by 'usb-modeswitch'"; # Converted to throw 2022-02-22
  usbguard-nox = throw "'usbguard-nox' has been renamed to/replaced by 'usbguard'"; # Converted to throw 2023-09-10
  util-linuxCurses = util-linux; # Added 2022-04-12
  utillinux = util-linux; # Added 2020-11-24

  ### V ###

  v4l_utils = throw "'v4l_utils' has been renamed to/replaced by 'v4l-utils'"; # Converted to throw 2023-09-10
  valkyrie = throw "valkyrie was removed from nixpkgs, because it is unmaintained upstream"; # Added 2022-05-10
  vamp = { vampSDK = vamp-plugin-sdk; }; # Added 2020-03-26
  vaapiIntel = intel-vaapi-driver; # Added 2023-05-31
  vapor = throw "vapor was removed because it was unmaintained and upstream service no longer exists";
  varnish62 = throw "varnish62 was removed from nixpkgs, because it is unmaintained upstream. Please switch to a different release"; # Added 2021-07-26
  varnish63 = throw "varnish63 was removed from nixpkgs, because it is unmaintained upstream. Please switch to a different release"; # Added 2021-07-26
  varnish65 = throw "varnish65 was removed from nixpkgs, because it is unmaintained upstream. Please switch to a different release"; # Added 2021-09-15
  varnish70 = throw "varnish70 was removed from nixpkgs, because it was superseded upstream. Please switch to a different release"; # Added 2022-03-17
  vaultwarden-vault = vaultwarden.webvault; # Added 2022-12-13
  varnish71 = throw "varnish71 was removed from nixpkgs, because it was superseded upstream. Please switch to a different release"; # Added 2022-11-08
  vdirsyncerStable  = vdirsyncer; # Added 2020-11-08, see https://github.com/NixOS/nixpkgs/issues/103026#issuecomment-723428168
  ventoy-bin = ventoy; # Added 2023-04-12
  ventoy-bin-full = ventoy-full; # Added 2023-04-12
  venus = throw "venus has been removed from nixpkgs, as it's unmaintained"; # Added 2021-02-05
  vgo2nix = throw "vgo2nix has been removed, because it was deprecated. Consider using gomod2nix instead"; # added 2022-08-24
  ViennaRNA = viennarna; # Added 2023-08-23
  vimHugeX = vim-full; # Added 2022-12-04
  vim_configurable = vim-full; # Added 2022-12-04
  vimbWrapper = throw "'vimbWrapper' has been renamed to/replaced by 'vimb'"; # Converted to throw 2022-02-22
  virtinst = throw "virtinst has been removed, as it's included in virt-manager"; # Added 2021-07-21
  virtuoso = throw "virtuoso has been removed, because it was unmaintained in nixpkgs"; # added 2021-12-15
  virtmanager = throw "'virtmanager' has been renamed to/replaced by 'virt-manager'"; # Converted to throw 2023-09-10
  virtmanager-qt = throw "'virtmanager-qt' has been renamed to/replaced by 'virt-manager-qt'"; # Converted to throw 2023-09-10
  virtviewer = throw "'virtviewer' has been renamed to/replaced by 'virt-viewer'"; # Converted to throw 2022-02-22
  vivaldi-widevine = throw "'vivaldi-widevine' has been renamed to/replaced by 'widevine-cdm'"; # Added 2023-02-25
  vkBasalt = vkbasalt; # Added 2022-11-22
  vnc2flv = throw "vnc2flv has been removed: abandoned by upstream"; # Added 2022-03-21
  vorbisTools = throw "'vorbisTools' has been renamed to/replaced by 'vorbis-tools'"; # Converted to throw 2022-02-22
  vte_290 = throw "'vte_290' has been renamed to/replaced by 'vte'"; # Added 2023-01-05
  vtun = throw "vtune has been removed as it's unmaintained upstream"; # Added 2021-10-29
  inherit (libsForQt5.mauiPackages) vvave; # added 2022-05-17

  ### W ###
  wavesurfer = throw "wavesurfer has been removed: depended on snack which has been removed"; # Added 2022-04-21
  waybar-hyprland = throw "waybar-hyprland has been removed: hyprland support is now built into waybar by default."; # Added 2023-08-21
  way-cooler = throw "way-cooler is abandoned by its author: https://way-cooler.org/blog/2020/01/09/way-cooler-post-mortem.html"; # Added 2020-01-13
  wayfireApplications-unwrapped = throw ''
    'wayfireApplications-unwrapped.wayfire' has been renamed to/replaced by 'wayfire'
    'wayfireApplications-unwrapped.wayfirePlugins' has been renamed to/replaced by 'wayfirePlugins'
    'wayfireApplications-unwrapped.wcm' has been renamed to/replaced by 'wayfirePlugins.wcm'
    'wayfireApplications-unwrapped.wlroots' has been removed
  ''; # Add 2023-07-29
  wcm = throw "'wcm' has been renamed to/replaced by 'wayfirePlugins.wcm'"; # Add 2023-07-29
  webbrowser = throw "webbrowser was removed because it's unmaintained upstream and was marked as broken in nixpkgs for over a year"; # Added 2022-03-21
  webkit = throw "'webkit' has been renamed to/replaced by 'webkitgtk'"; # Converted to throw 2022-02-22
  webkitgtk_5_0 = throw "'webkitgtk_5_0' has been superseded by 'webkitgtk_6_0'"; # Added 2023-02-25
  weechat-matrix-bridge = throw "'weechat-matrix-bridge' has been renamed to/replaced by 'weechatScripts.weechat-matrix-bridge'"; # Converted to throw 2022-02-22
  weighttp = throw "weighttp has been removed: abandoned by upstream"; # Added 2022-04-20
  whirlpool-gui = throw "whirlpool-gui has been removed as it depended on an insecure version of Electron"; # added 2022-02-08
  wio = throw "wio has been removed from nixpkgs, it was unmaintained and required wlroots_0_14 at the time of removal"; # Added 2023-04-28
  wicd = throw "wicd has been removed as it is abandoned"; # Added 2021-09-11
  wineFull = throw "'wineFull' has been renamed to/replaced by 'winePackages.full'"; # Converted to throw 2022-02-22
  wineMinimal = throw "'wineMinimal' has been renamed to/replaced by 'winePackages.minimal'"; # Converted to throw 2022-02-22
  wineStable = throw "'wineStable' has been renamed to/replaced by 'winePackages.stable'"; # Converted to throw 2022-02-22
  wineStaging = throw "'wineStaging' has been renamed to/replaced by 'wine-staging'"; # Converted to throw 2022-02-22
  wineUnstable = throw "'wineUnstable' has been renamed to/replaced by 'winePackages.unstable'"; # Converted to throw 2022-02-22
  wineWayland = wine-wayland;
  win-qemu = throw "'win-qemu' has been replaced by 'win-virtio'"; # Added 2023-08-16
  win-signed-gplpv-drivers = throw "win-signed-gplpv-drivers has been removed from nixpkgs, as it's unmaintained: https://help.univention.com/t/installing-signed-gplpv-drivers/21828"; # Added 2023-08-17
  winpdb = throw "winpdb has been removed: abandoned by upstream"; # Added 2022-04-22
  winusb = throw "'winusb' has been renamed to/replaced by 'woeusb'"; # Converted to throw 2022-02-22
  wireguard = throw "'wireguard' has been renamed to/replaced by 'wireguard-tools'"; # Converted to throw 2022-02-22
  wlroots_0_14 = throw "'wlroots_0_14' has been removed in favor of newer versions"; # Added 2023-07-29
  wormhole-rs = magic-wormhole-rs; # Added 2022-05-30. preserve, reason: Arch package name, main binary name
  wmii_hg = wmii;
  wmc-mpris = throw "wmc-mpris has been abandoned by upstream due to its redundancy"; # Added 2022-11-13
  ws = throw "ws has been dropped due to the lack of maintenance from upstream since 2018"; # Added 2022-06-03
  wxGTK = throw "wxGTK28 has been removed from nixpkgs as it has reached end of life"; # Added 2022-11-04
  wxGTK28 = throw "wxGTK28 has been removed from nixpkgs as it has reached end of life"; # Added 2022-11-04
  wxGTK29 = throw "wxGTK29 has been removed from nixpkgs as it has reached end of life"; # Added 2022-11-04
  wxGTK30 = throw "wxGTK30 has been removed from nixpkgs as it has reached end of life"; # Added 2023-03-22
  wxGTK30-gtk2 = wxGTK30; # Added 2022-12-03
  wxGTK30-gtk3 = wxGTK30; # Added 2022-12-03
  wxGTK31-gtk2 = throw "'wxGTK31-gtk2' has been removed from nixpkgs as it depends on deprecated GTK2"; # Added 2022-10-27
  wxGTK31-gtk3 = throw "'wxGTK31-gtk3' has been renamed to/replaced by 'wxGTK31'"; # Added 2022-10-27
  wxmac = wxGTK30; # Added 2023-03-22
  wxmupen64plus = throw "wxmupen64plus was removed because the upstream disappeared"; # Added 2022-01-31
  wxcam = throw "'wxcam' has seen no updates in ten years, crashes (SIGABRT) on startup and depends on deprecated wxGTK28/GNOME2/GTK2, use 'gnome.cheese'"; # Added 2022-06-15

  ### X ###

  x11 = throw "'x11' has been renamed to/replaced by its constituents"; # Converted to throw 2022-02-22
  xara = throw "xara has been removed from nixpkgs. Unmaintained since 2006"; # Added 2020-06-24
  xbmc = throw "'xbmc' has been renamed to/replaced by 'kodi'"; # Converted to throw 2022-02-22
  xbmc-retroarch-advanced-launchers = kodi-retroarch-advanced-launchers; # Added 2021-11-19
  xbmcPlain = throw "'xbmcPlain' has been renamed to/replaced by 'kodiPlain'"; # Converted to throw 2022-02-22
  xbmcPlugins = throw "'xbmcPlugins' has been renamed to/replaced by 'kodiPackages'"; # Converted to throw 2022-02-22
  xdg_utils = xdg-utils; # Added 2021-02-01
  xfce4-14 = throw "xfce4-14 has been removed, use xfce instead"; # added 2022-12-25
  xfceUnstable = throw "xfceUnstable has been removed, use xfce instead"; # added 2022-12-25
  xineLib = xine-lib; # Added 2021-04-27
  xineUI = xine-ui; # Added 2021-04-27
  xlibsWrapper = throw "'xlibsWrapper' has been replaced by its constituents"; # Converted to throw 2022-12-27
  xmonad_log_applet_gnome3 = throw "'xmonad_log_applet_gnome3' has been renamed to/replaced by 'xmonad_log_applet'"; # Converted to throw 2022-02-22
  xmpp-client = throw "xmpp-client has been dropped due to the lack of maintenance from upstream since 2017"; # Added 2022-06-02
  xmpppy = throw "xmpppy has been removed from nixpkgs as it is unmaintained and python2-only";
  xp-pen-g430 = throw "xp-pen-g430 has been renamed to xp-pen-g430-driver"; # Converted to throw 2022-06-23
  xpf = throw "xpf has been removed: abandoned by upstream"; # Added 2022-04-26
  xf86_video_nouveau = throw "'xf86_video_nouveau' has been renamed to/replaced by 'xorg.xf86videonouveau'"; # Converted to throw 2022-02-22
  xf86_input_mtrack = throw ''
    xf86_input_mtrack has been removed from nixpkgs as it is broken and
    unmaintained. Working alternatives are libinput and synaptics.
  '';
  xf86_input_multitouch = throw "xf86_input_multitouch has been removed from nixpkgs"; # Added 2020-01-20
  xlibs = throw "'xlibs' has been renamed to/replaced by 'xorg'"; # Converted to throw 2022-02-22
  xow = throw (
    "Upstream has ended support for 'xow' and the package has been removed" +
    "from nixpkgs. Users are urged to switch to 'xone'."
  ); # Added 2022-08-02
  xpraGtk3 = throw "'xpraGtk3' has been renamed to/replaced by 'xpra'"; # Converted to throw 2022-02-22
  xtrt = throw "xtrt has been removed due to being abandoned"; # Added 2023-05-25
  xvidcap = throw "'xvidcap' has been removed because of a broken dependency"; # Added 2022-11-08
  xvfb_run = xvfb-run; # Added 2021-05-07

  ### Y ###

  yacc = bison; # moved from top-level 2021-03-14
  yafaray-core = libyafaray; # Added 2022-09-23
  yarn2nix-moretea-openssl_1_1 = throw "'yarn2nix-moretea-openssl_1_1' has been removed."; # Added 2023-02-04
  yarssr = throw "yarssr has been removed as part of the python2 deprecation"; # Added 2022-01-15
  youtubeDL = throw "'youtubeDL' has been renamed to/replaced by 'youtube-dl'"; # Converted to throw 2022-02-22
  ytop = throw "ytop has been abandoned by upstream. Consider switching to bottom instead";
  yubikey-neo-manager = throw "yubikey-neo-manager has been removed because it was broken. Use yubikey-manager-qt instead"; # Added 2021-03-08
  yubioath-desktop = throw "yubioath-desktop has been deprecated by upstream in favor of yubioath-flutter"; # Added 2022-11-22
  yuzu-ea = yuzu-early-access; # Added 2022-08-18
  yuzu = yuzu-mainline; # Added 2021-01-25

  ### Z ###

  zabbix30 = throw "Zabbix 3.0.x is end of life, see https://www.zabbix.com/documentation/5.0/manual/installation/upgrade/sources for a direct upgrade path to 5.0.x"; # Added 2021-04-07
  zdfmediathk = throw "'zdfmediathk' has been renamed to/replaced by 'mediathekview'"; # Converted to throw 2022-02-22
  zimreader = throw "zimreader has been removed from nixpkgs as it has been replaced by kiwix-serve and stopped working with modern zimlib versions"; # Added 2021-03-28
  zimwriterfs = throw "zimwriterfs is now part of zim-tools"; # Added 2022-06-10.
  zinc = zincsearch; # Added 2023-05-28
  zq = zed.overrideAttrs (old: { meta = old.meta // { mainProgram = "zq"; }; }); # Added 2023-02-06

  ### UNSORTED ###

  ocamlPackages_latest = throw "'ocamlPackages_latest' has been renamed to/replaced by 'ocaml-ng.ocamlPackages_latest'"; # Converted to throw 2022-02-22

  ocamlformat_0_11_0 = throw "ocamlformat_0_11_0 has been removed in favor of newer versions"; # Added 2022-06-01
  ocamlformat_0_12 = throw "ocamlformat_0_12 has been removed in favor of newer versions"; # Added 2022-06-01
  ocamlformat_0_13_0 = throw "ocamlformat_0_13_0 has been removed in favor of newer versions"; # Added 2022-06-01
  ocamlformat_0_14_0 = throw "ocamlformat_0_14_0 has been removed in favor of newer versions"; # Added 2022-06-01
  ocamlformat_0_14_1 = throw "ocamlformat_0_14_1 has been removed in favor of newer versions"; # Added 2022-06-01
  ocamlformat_0_14_2 = throw "ocamlformat_0_14_2 has been removed in favor of newer versions"; # Added 2022-06-01
  ocamlformat_0_14_3 = throw "ocamlformat_0_14_3 has been removed in favor of newer versions"; # Added 2022-06-01
  ocamlformat_0_15_0 = throw "ocamlformat_0_15_0 has been removed in favor of newer versions"; # Added 2022-06-01
  ocamlformat_0_15_1 = throw "ocamlformat_0_15_1 has been removed in favor of newer versions"; # Added 2022-06-01
  ocamlformat_0_16_0 = throw "ocamlformat_0_16_0 has been removed in favor of newer versions"; # Added 2022-06-01
  ocamlformat_0_17_0 = throw "ocamlformat_0_17_0 has been removed in favor of newer versions"; # Added 2022-06-01
  ocamlformat_0_18_0 = throw "ocamlformat_0_18_0 has been removed in favor of newer versions"; # Added 2022-06-01

  zabbix44 = throw ''
    Zabbix 4.4 is end of life. For details on upgrading to Zabbix 5.0 look at
    https://www.zabbix.com/documentation/current/manual/installation/upgrade_notes_500
  ''; # Added 2020-08-17

  zeroc_ice = throw "'zeroc_ice' has been renamed to/replaced by 'zeroc-ice'"; # Converted to throw 2023-09-10

  # Added 2020-06-22
  zeromq3 = throw "zeromq3 has been deprecated by zeromq4";
  jzmq = throw "jzmq has been removed from nixpkgs, as it was unmaintained";

  ant-dracula-theme = throw "ant-dracula-theme is now dracula-theme, and theme name is Dracula instead of Ant-Dracula";
  dina-font-pcf = dina-font; # Added 2020-02-09
  dnscrypt-proxy2 = dnscrypt-proxy; # Added 2023-02-02
  gcc-snapshot = throw "gcc-snapshot: Marked as broken for >2 years, additionally this 'snapshot' pointed to a fairly old one from gcc7";
  gnatsd = throw "'gnatsd' has been renamed to/replaced by 'nats-server'"; # Converted to throw 2023-09-10

  obs-gstreamer = throw ''
    obs-gstreamer has been converted into a plugin for use with wrapOBS.
    Its new location is obs-studio-plugins.obs-gstreamer.
  ''; # Added 2021-06-01

  obs-move-transition = throw ''
    obs-move-transition has been converted into a plugin for use with wrapOBS.
    Its new location is obs-studio-plugins.obs-move-transition.
  ''; # Added 2021-06-01

  obs-multi-rtmp = throw ''
    obs-multi-rtmp has been converted into a plugin for use with wrapOBS.
    Its new location is obs-studio-plugins.obs-multi-rtmp.
  ''; # Added 2021-06-01

  obs-ndi = throw ''
    obs-ndi has been converted into a plugin for use with wrapOBS.
    Its new location is obs-studio-plugins.obs-ndi.
  ''; # Added 2021-06-01

  obs-v4l2sink = throw "obs-v4l2sink is integrated into upstream OBS since version 26.1"; # Added 2021-06-01

  obs-wlrobs = throw ''
    wlrobs has been converted into a plugin for use with wrapOBS.
    Its new location is obs-studio-plugins.wlrobs.
  ''; # Added 2021-06-01

  posix_man_pages = man-pages-posix; # Added 2021-04-15
  sqldeveloper_18 = throw "sqldeveloper_18 is not maintained anymore!"; # Added 2020-02-04
  todolist = throw "todolist is now ultralist"; # Added 2020-12-27
  tor-browser-bundle = throw "tor-browser-bundle was removed because it was out of date and inadequately maintained. Please use tor-browser-bundle-bin instead"; # Added 2020-01-10
  tor-browser-unwrapped = throw "tor-browser-unwrapped was removed because it was out of date and inadequately maintained. Please use tor-browser-bundle-bin instead"; # Added 2020-01-10
  torchat = throw "torchat was removed because it was broken and requires Python 2"; # added 2022-06-05
  ttyrec = ovh-ttyrec; # Added 2021-01-02
  zplugin = zinit; # Added 2021-01-30
  zyn-fusion = zynaddsubfx; # Added 2022-08-05

  inherit (stdenv.hostPlatform) system; # Added 2021-10-22
  inherit (stdenv) buildPlatform hostPlatform targetPlatform; # Added 2023-01-09

  # LLVM packages for (integration) testing that should not be used inside Nixpkgs:
  llvmPackages_latest = llvmPackages_16;
  llvmPackages_git = recurseIntoAttrs (callPackage ../development/compilers/llvm/git {
    inherit (stdenvAdapters) overrideCC;
    buildLlvmTools = buildPackages.llvmPackages_git.tools;
    targetLlvmLibraries = targetPackages.llvmPackages_git.libraries or llvmPackages_git.libraries;
    targetLlvm = targetPackages.llvmPackages_git.llvm or llvmPackages_git.llvm;
  });

  # Added 2022-01-28
  zeroc-ice-36 = throw "Unmaintained, doesn't build w/glibc-2.34";

  /* If these are in the scope of all-packages.nix, they cause collisions
  between mixed versions of qt. See:
  https://github.com/NixOS/nixpkgs/pull/101369 */

  inherit (plasma5Packages)
    akonadi akregator arianna ark bluedevil bomber bovo breeze-grub breeze-gtk
    breeze-icons breeze-plymouth breeze-qt5 colord-kde discover dolphin dragon elisa falkon
    ffmpegthumbs filelight granatier gwenview k3b kactivitymanagerd kaddressbook
    kalzium kapman kapptemplate kate katomic kblackbox kblocks kbounce
    kcachegrind kcalc kcharselect kcolorchooser kde-cli-tools kde-gtk-config
    kdenlive kdeplasma-addons kdevelop-pg-qt kdevelop-unwrapped kdev-php
    kdev-python kdevelop kdf kdialog kdiamond keditbookmarks kfind
    kgamma5 kget kgpg khelpcenter kig kigo killbots kinfocenter kitinerary
    kleopatra klettres klines kmag kmail kmenuedit kmines kmix kmplot
    knavalbattle knetwalk knights kollision kolourpaint kompare konsole kontact
    konversation korganizer kpkpass krdc kreversi krfb kscreen kscreenlocker
    kshisen ksquares ksshaskpass ksystemlog kteatime ktimer ktorrent ktouch
    kturtle kwallet-pam kwalletmanager kwave kwayland-integration kwin kwrited
    marble merkuro milou minuet okular oxygen oxygen-icons5 picmi
    plasma-browser-integration plasma-desktop plasma-integration plasma-nano
    plasma-nm plasma-pa plasma-mobile plasma-systemmonitor plasma-thunderbolt
    plasma-vault plasma-workspace plasma-workspace-wallpapers polkit-kde-agent
    powerdevil qqc2-breeze-style sddm-kcm skanlite skanpage spectacle
    systemsettings xdg-desktop-portal-kde yakuake zanshin
  ;

  kalendar = merkuro;  # Renamed in 23.08
  kfloppy = throw "kfloppy has been removed upstream in KDE Gear 23.08";

  inherit (plasma5Packages.thirdParty)
    krohnkite
    krunner-ssh
    krunner-symbols
    kwin-dynamic-workspaces
    kwin-tiling
    plasma-applet-caffeine-plus
    plasma-applet-virtual-desktop-bar
  ;

  inherit (libsForQt5)
    sddm
  ;

  inherit (pidginPackages)
    pidgin-indicator
    pidgin-latex
    pidgin-msn-pecan
    pidgin-mra
    pidgin-skypeweb
    pidgin-carbons
    pidgin-xmpp-receipts
    pidgin-otr
    pidgin-osd
    pidgin-sipe
    pidgin-window-merge
    purple-discord
    purple-googlechat
    purple-hangouts
    purple-lurch
    purple-matrix
    purple-mm-sms
    purple-plugin-pack
    purple-signald
    purple-slack
    purple-vk-plugin
    purple-xmpp-http-upload
    tdlib-purple
    pidgin-opensteamworks
    purple-facebook
  ;

})
