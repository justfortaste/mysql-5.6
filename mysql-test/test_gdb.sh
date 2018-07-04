./mysql-test-run.pl --mem --async-client --parallel=16 --fast --max-test-fail=1000 --retry=0 --force --mysqld=--rocksdb --mysqld=--default-storage-engine=rocksdb --mysqld=--skip-innodb --mysqld=--default-tmp-storage-engine=MyISAM  $1  --manual-gdb

