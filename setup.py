#!/usr/bin/env python
# -*- coding: utf-8 -*-
from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

ext_modules = [Extension('alsa', ['alsa.pyx'],
	libraries=['asound'],
#	include_dirs=['/usr/include/alsa/'],
#	extra_compile_args=["-Wno-cast-qual", "-Wno-strict-prototypes"],
	)]

setup(
	name = 'alsa',
#	version='1.12',
#	description='pyneod daemon suite',
	cmdclass = {'build_ext': build_ext},
	ext_modules = ext_modules,
	author='Johannes Schauer',
	author_email='josch@pyneo.org',
	)
# vim:tw=0:nowrap
