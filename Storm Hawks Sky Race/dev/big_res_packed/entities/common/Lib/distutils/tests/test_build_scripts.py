# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/distutils/tests/test_build_scripts.py
# Compiled at: 2008-12-16 09:38:07
"""Tests for distutils.command.build_scripts."""
import os, unittest
from distutils.command.build_scripts import build_scripts
from distutils.core import Distribution
from distutils.tests import support

class BuildScriptsTestCase(support.TempdirManager, support.LoggingSilencer, unittest.TestCase):

    def test_default_settings(self):
        cmd = self.get_build_scripts_cmd('/foo/bar', [])
        self.assert_(not cmd.force)
        self.assert_(cmd.build_dir is None)
        cmd.finalize_options()
        self.assert_(cmd.force)
        self.assertEqual(cmd.build_dir, '/foo/bar')
        return

    def test_build(self):
        source = self.mkdtemp()
        target = self.mkdtemp()
        expected = self.write_sample_scripts(source)
        cmd = self.get_build_scripts_cmd(target, [ os.path.join(source, fn) for fn in expected
                                                 ])
        cmd.finalize_options()
        cmd.run()
        built = os.listdir(target)
        for name in expected:
            self.assert_(name in built)

    def get_build_scripts_cmd(self, target, scripts):
        import sys
        dist = Distribution()
        dist.scripts = scripts
        dist.command_obj['build'] = support.DummyCommand(build_scripts=target, force=1, executable=sys.executable)
        return build_scripts(dist)

    def write_sample_scripts(self, dir):
        expected = []
        expected.append('script1.py')
        self.write_script(dir, 'script1.py', '#! /usr/bin/env python2.3\n# bogus script w/ Python sh-bang\npass\n')
        expected.append('script2.py')
        self.write_script(dir, 'script2.py', '#!/usr/bin/python\n# bogus script w/ Python sh-bang\npass\n')
        expected.append('shell.sh')
        self.write_script(dir, 'shell.sh', '#!/bin/sh\n# bogus shell script w/ sh-bang\nexit 0\n')
        return expected

    def write_script(self, dir, name, text):
        f = open(os.path.join(dir, name), 'w')
        f.write(text)
        f.close()


def test_suite():
    return unittest.makeSuite(BuildScriptsTestCase)


if __name__ == '__main__':
    unittest.main(defaultTest='test_suite')