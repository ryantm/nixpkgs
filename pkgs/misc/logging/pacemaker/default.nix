{ lib, stdenv,
    automake,
    autoconf,
    bash,
    libtool,
    libuuid,
    pkgconfig,
    python3,
    glib,
    libxml2,
    libxslt,
    bzip2,
    gnutls,
    pam,
    libqb,
    corosync,
    fetchFromGitHub,
} :

stdenv.mkDerivation rec {
  pname = "pacemaker";
  version = "1.1.24";

  src = fetchFromGitHub {
    owner = "ClusterLabs";
    repo = pname;
    rev = "Pacemaker-${version}";
    sha256 = "sha256:105wr5yla389g7jsxv503jpayavnl3c2sysi78zrfn5fy2afrsgs";
  };

  nativeBuildInputs = [
    automake
    autoconf
    bash
    libtool
    libuuid
    pkgconfig
    python3
    glib
    libxml2
    libxslt
    bzip2
    gnutls
    pam
    libqb
  ];

  buildInputs = [
    corosync
  ];

  postPatch = ''
    substituteInPlace configure.ac --replace "/usr/lib" "$libdir"
    substituteInPlace configure.ac --replace "-Werror" ""
    substituteInPlace configure.ac --replace "-Wstrict-prototypes" ""
  '';

  preConfigure = "./autogen.sh";

  configureFlags = [
    "--prefix=${placeholder "out"}"
    "--exec-prefix=${placeholder "out"}"
    "--sysconfdir=/etc"
    "--datadir=/var/lib"
    "--localstatedir=/var"
    "--with-corosync"
  ];

  installFlags = [ "DESTDIR=${placeholder "out"}" ];

  postInstall = ''
    mv $out$out/* $out
    rm -r $out$out
  '';

  meta = with lib; {
    homepage = "https://clusterlabs.org/pacemaker/";
    description = "Pacemaker is an open source, high availability resource manager suitable for both small and large clusters.";
    license = licenses.gpl2;
    platforms = platforms.linux;
    maintainers = with maintainers; [ ryantm ];
  };
}
