# This file is not tested, don't run it
exit;

cd ../;
rm -rf package-lists-backup;
cp -R package-lists package-lists-backup;
mkdir package-lists;
gem list >> package-lists/ruby.txt
pip freeze >> package-lists/python.txt
npm list -g --depth=0 2>/dev/null >> package-lists/npm.txt
# do brewfiles if osx
# do apm
cd -;
