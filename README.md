# Centos/RHEL 6.6 Build Container for C/C++11 Applications

This Docker image supports building C/C++ applications targets to Centos/RHEL 6.6.

## Newer GCC/G++

It extends the basic distribution by adding a newer version ([4.8.1](https://gcc.gnu.org/gcc-4.8/changes.html)) of gcc/g++ that supports most C++11 standard features.

## Additional Build Tools

Other common development tools also included:

| package                                                              |  version | description                                                                                                                          |
|----------------------------------------------------------------------|---------:|--------------------------------------------------------------------------------------------------------------------------------------|
| [cmake](https://cmake.org/cmake/help/v2.8.12/cmake.html)             | 2.8.12.2 | CMake is cross-platform free and open-source software for managing the build process of software using a compiler-independent method |
| [Google C++ Testing Framework](https://github.com/google/googletest) |    1.8.0 | Google Test is a unit testing library for the C++ programming language, based on the xUnit architecture                              |
| [popt-devel](http://freecode.com/projects/popt)                      |     1.13 | Popt is a C library for parsing command line parameters                                                                              |
| [zlib-devel](http://zlib.net)                                        |    1.2.3 | zlib is designed to be a free, general-purpose, legally unencumbered lossless data-compression library                               |
| [glib2-devel](https://developer.gnome.org/glib/)                     |   2.28.8 | GLib provides the core application building blocks for libraries and applications written in C                                       |
| [libsodium](https://www.gitbook.com/book/jedisct1/libsodium/details) |    0.4.5 | Sodium is a modern, easy-to-use software library for encryption, decryption, signatures, password hashing and more                   |
