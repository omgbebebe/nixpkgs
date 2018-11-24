{ stdenv, fetchurl, cmake, pkgconfig }:

stdenv.mkDerivation rec {
  name = "liblemon-${version}";
  version = "1.3.1";

  nativeBuildInputs = [ cmake pkgconfig ];

  src = fetchurl {
    url = "http://lemon.cs.elte.hu/pub/sources/lemon-${version}.tar.gz";
    sha256 = "1j6kp9axhgna47cfnmk1m7vnqn01hwh7pf1fp76aid60yhjwgdvi";
  };

  enableParallelBuilding = true;
  doCheck = true;

  meta = with stdenv.lib; {
    description = "Library for Efficient Modeling and Optimization in Networks";
    homepage = https://lemon.cs.elte.hu;
    license = licenses.boost;
    platforms = platforms.linux;
    maintainers = with maintainers; [ omg ];
  };
}
