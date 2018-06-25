# centos6.5 安装ruby 2.3.1

> 2018-06-25 Booboowei

## 步骤概览

```shell
#现在的版本
[root@hd4 /]# ruby --version
ruby 1.8.7 (2013-06-27 patchlevel 374) [x86_64-linux]

#升级过程
[root@hd4 /]# curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
[root@hd4 /]# curl -L get.rvm.io | bash -s stable
[root@hd4 /]# source /etc/profile.d/rvm.sh
[root@hd4 /]# rvm requirements
[root@hd4 /]# rvm install ruby 2.3.1

#设置默认版本
[root@hd4 /]# rvm --default use 2.3.1

#检查安装结果
[root@hd4 /]# ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-linux]
```

## 操作明细

```shell
[root@xym-csos-server ~]# which ruby
/usr/bin/ruby
[root@xym-csos-server ~]# ruby -v
ruby 1.8.7 (2013-06-27 patchlevel 374) [x86_64-linux]
[root@xym-csos-server ~]#  curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
gpg: directory `/root/.gnupg' created
gpg: new configuration file `/root/.gnupg/gpg.conf' created
gpg: WARNING: options in `/root/.gnupg/gpg.conf' are not yet active during this run
gpg: keyring `/root/.gnupg/secring.gpg' created
gpg: keyring `/root/.gnupg/pubring.gpg' created
gpg: /root/.gnupg/trustdb.gpg: trustdb created
gpg: key D39DC0E3: public key "Michal Papis (RVM signing) <mpapis@gmail.com>" imported
gpg: Total number processed: 1
gpg:               imported: 1  (RSA: 1)
gpg: no ultimately trusted keys found
[root@xym-csos-server ~]#  curl -L get.rvm.io | bash -s stable
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 24361  100 24361    0     0   5412      0  0:00:04  0:00:04 --:--:-- 24458
Downloading https://github.com/rvm/rvm/archive/1.29.3.tar.gz
Downloading https://github.com/rvm/rvm/releases/download/1.29.3/1.29.3.tar.gz.asc
gpg: Signature made Mon 11 Sep 2017 04:59:21 AM CST using RSA key ID BF04FF17
gpg: Good signature from "Michal Papis (RVM signing) <mpapis@gmail.com>"
gpg:                 aka "Michal Papis <michal.papis@toptal.com>"
gpg:                 aka "[jpeg image of size 5015]"
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 409B 6B17 96C2 7546 2A17  0311 3804 BB82 D39D C0E3
     Subkey fingerprint: 62C9 E5F4 DA30 0D94 AC36  166B E206 C29F BF04 FF17
GPG verified '/usr/local/rvm/archives/rvm-1.29.3.tgz'
Creating group 'rvm'

Installing RVM to /usr/local/rvm/
Installation of RVM in /usr/local/rvm/ is almost complete:

  * First you need to add all users that will be using rvm to 'rvm' group,
    and logout - login again, anyone using rvm will be operating with `umask u=rwx,g=rwx,o=rx`.

  * To start using RVM you need to run `source /etc/profile.d/rvm.sh`
    in all your open shell windows, in rare cases you need to reopen all shell windows.
[root@xym-csos-server ~]# source /etc/profile.d/rvm.sh
[root@xym-csos-server ~]# rvm requirements
Checking requirements for centos.
Installing requirements for centos.
Installing required packages: bison, gcc-c++, libffi-devel, libtool, readline-devel, sqlite-devel, libyaml-devel...........
Requirements installation successful.
[root@xym-csos-server ~]# rvm install ruby 2.3.1
Searching for binary rubies, this might take some time.
Found remote file https://rvm_io.global.ssl.fastly.net/binaries/centos/6/x86_64/ruby-2.3.1.tar.bz2
Checking requirements for centos.
Requirements installation successful.
ruby-2.3.1 - #configure
ruby-2.3.1 - #download
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 22.5M  100 22.5M    0     0  3730k      0  0:00:06  0:00:06 --:--:-- 6659k
ruby-2.3.1 - #validate archive
ruby-2.3.1 - #extract
ruby-2.3.1 - #validate binary
ruby-2.3.1 - #setup
ruby-2.3.1 - #gemset created /usr/local/rvm/gems/ruby-2.3.1@global
ruby-2.3.1 - #importing gemset /usr/local/rvm/gemsets/global.gems...................................
ruby-2.3.1 - #generating global wrappers........
ruby-2.3.1 - #gemset created /usr/local/rvm/gems/ruby-2.3.1
ruby-2.3.1 - #importing gemsetfile /usr/local/rvm/gemsets/default.gems evaluated to empty gem list
ruby-2.3.1 - #generating default wrappers........
[root@xym-csos-server ~]# rvm --default use 2.3.1
Using /usr/local/rvm/gems/ruby-2.3.1
[root@xym-csos-server ~]# ruby -v
ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-linux]



root@xym-csos-server ~]# which gem
/usr/local/rvm/rubies/ruby-2.3.1/bin/gem


[root@xym-csos-server ~]# gem install redis-dump -V
GET https://rubygems.org/latest_specs.4.8.gz
200 OK
GET https://rubygems.org/quick/Marshal.4.8/redis-dump-0.4.0.gemspec.rz
200 OK
GET https://rubygems.org/specs.4.8.gz
200 OK
GET https://rubygems.org/quick/Marshal.4.8/yajl-ruby-1.4.0.gemspec.rz
200 OK
GET https://rubygems.org/quick/Marshal.4.8/redis-4.0.1.gemspec.rz
200 OK
GET https://rubygems.org/quick/Marshal.4.8/uri-redis-0.4.2.gemspec.rz
200 OK
GET https://rubygems.org/quick/Marshal.4.8/drydock-0.6.9.gemspec.rz
200 OK
Downloading gem yajl-ruby-1.4.0.gem
GET https://rubygems.org/gems/yajl-ruby-1.4.0.gem
Fetching: yajl-ruby-1.4.0.gem (100%)
200 OK
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/.codeclimate.yml
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/.gitignore
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/.rspec
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/.travis.yml
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/CHANGELOG.md
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/Gemfile
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/LICENSE
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/README.md
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/Rakefile
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/benchmark/encode.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/benchmark/encode_json_and_marshal.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/benchmark/encode_json_and_yaml.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/benchmark/http.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/benchmark/parse.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/benchmark/parse_json_and_marshal.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/benchmark/parse_json_and_yaml.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/benchmark/parse_stream.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/benchmark/subjects/item.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/benchmark/subjects/ohai.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/benchmark/subjects/ohai.marshal_dump
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/benchmark/subjects/ohai.yml
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/benchmark/subjects/twitter_search.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/benchmark/subjects/twitter_stream.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/benchmark/subjects/unicode.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/examples/encoding/chunked_encoding.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/examples/encoding/one_shot.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/examples/encoding/to_an_io.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/examples/http/twitter_search_api.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/examples/http/twitter_stream_api.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/examples/parsing/from_file.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/examples/parsing/from_stdin.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/examples/parsing/from_string.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/api/yajl_common.h
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/api/yajl_gen.h
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/api/yajl_parse.h
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/api/yajl_version.h
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/extconf.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/yajl.c
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/yajl_alloc.c
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/yajl_alloc.h
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/yajl_buf.c
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/yajl_buf.h
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/yajl_bytestack.h
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/yajl_encode.c
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/yajl_encode.h
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/yajl_ext.c
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/yajl_ext.h
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/yajl_gen.c
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/yajl_lex.c
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/yajl_lex.h
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/yajl_parser.c
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/yajl_parser.h
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/ext/yajl/yajl_version.c
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/lib/yajl.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/lib/yajl/bzip2.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/lib/yajl/bzip2/stream_reader.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/lib/yajl/bzip2/stream_writer.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/lib/yajl/deflate.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/lib/yajl/deflate/stream_reader.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/lib/yajl/deflate/stream_writer.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/lib/yajl/gzip.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/lib/yajl/gzip/stream_reader.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/lib/yajl/gzip/stream_writer.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/lib/yajl/http_stream.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/lib/yajl/json_gem.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/lib/yajl/json_gem/encoding.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/lib/yajl/json_gem/parsing.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/lib/yajl/version.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/script/bootstrap
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/encoding/encoding_spec.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/global/global_spec.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/http/fixtures/http.bzip2.dump
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/http/fixtures/http.chunked.dump
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/http/fixtures/http.deflate.dump
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/http/fixtures/http.error.dump
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/http/fixtures/http.gzip.dump
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/http/fixtures/http.html.dump
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/http/fixtures/http.raw.dump
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/http/http_delete_spec.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/http/http_error_spec.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/http/http_get_spec.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/http/http_post_spec.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/http/http_put_spec.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/http/http_stream_options_spec.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/json_gem_compatibility/compatibility_spec.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/active_support_spec.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/chunked_spec.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail.15.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail.16.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail.17.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail.26.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail11.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail12.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail13.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail14.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail19.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail20.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail21.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail22.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail23.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail24.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail25.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail27.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail28.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail3.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail4.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail5.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail6.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/fail9.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.array.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.codepoints_from_unicode_org.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.contacts.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.db100.xml.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.db1000.xml.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.dc_simple_with_comments.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.deep_arrays.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.difficult_json_c_test_case.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.difficult_json_c_test_case_with_comments.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.doubles.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.empty_array.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.empty_string.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.escaped_bulgarian.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.escaped_foobar.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.item.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.json-org-sample1.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.json-org-sample2.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.json-org-sample3.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.json-org-sample4-nows.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.json-org-sample4.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.json-org-sample5.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.map-spain.xml.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.ns-invoice100.xml.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.ns-soap.xml.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.numbers-fp-4k.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.numbers-fp-64k.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.numbers-int-4k.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.numbers-int-64k.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.twitter-search.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.twitter-search2.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.unicode.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass.yelp.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass1.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass2.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures/pass3.json
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/fixtures_spec.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/large_number_spec.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/parsing/one_off_spec.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/projection/project_file.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/projection/projection.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/rcov.opts
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/spec/spec_helper.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/tasks/compile.rake
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/tasks/rspec.rake
/usr/local/rvm/gems/ruby-2.3.1/gems/yajl-ruby-1.4.0/yajl-ruby.gemspec
Building native extensions.  This could take a while...
/usr/local/rvm/rubies/ruby-2.3.1/bin/ruby extconf.rb
creating Makefile
make "DESTDIR="
compiling yajl_buf.c
compiling yajl_lex.c
yajl_lex.c: In function ‘yajl_tok_name’:
yajl_lex.c:42: warning: enumeration value ‘yajl_tok_comment’ not handled in switch
compiling yajl_version.c
compiling yajl_parser.c
compiling yajl_encode.c
compiling yajl_ext.c
compiling yajl_gen.c
compiling yajl_alloc.c
compiling yajl.c
linking shared-object yajl/yajl.so
make "DESTDIR=" install
/usr/bin/install -c -m 0755 yajl.so ./.gem.20180622-9454-y24tn4/yajl

Successfully installed yajl-ruby-1.4.0
Downloading gem redis-4.0.1.gem
GET https://rubygems.org/gems/redis-4.0.1.gem
Fetching: redis-4.0.1.gem (100%)
200 OK
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/.gitignore
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/.travis.yml
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/.travis/Gemfile
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/.yardopts
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/CHANGELOG.md
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/Gemfile
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/LICENSE
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/README.md
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/benchmarking/logging.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/benchmarking/pipeline.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/benchmarking/speed.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/benchmarking/suite.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/benchmarking/worker.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/bors.toml
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/examples/basic.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/examples/consistency.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/examples/dist_redis.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/examples/incr-decr.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/examples/list.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/examples/pubsub.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/examples/sentinel.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/examples/sentinel/sentinel.conf
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/examples/sentinel/start
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/examples/sets.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/examples/unicorn/config.ru
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/examples/unicorn/unicorn.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/lib/redis.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/lib/redis/client.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/lib/redis/connection.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/lib/redis/connection/command_helper.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/lib/redis/connection/hiredis.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/lib/redis/connection/registry.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/lib/redis/connection/ruby.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/lib/redis/connection/synchrony.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/lib/redis/distributed.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/lib/redis/errors.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/lib/redis/hash_ring.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/lib/redis/pipeline.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/lib/redis/subscribe.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/lib/redis/version.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/makefile
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/redis.gemspec
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/bitpos_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/blocking_commands_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/client_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/command_map_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/commands_on_hashes_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/commands_on_hyper_log_log_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/commands_on_lists_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/commands_on_sets_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/commands_on_sorted_sets_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/commands_on_strings_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/commands_on_value_types_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/connection_handling_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/connection_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/db/.gitkeep
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_blocking_commands_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_commands_on_hashes_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_commands_on_hyper_log_log_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_commands_on_lists_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_commands_on_sets_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_commands_on_sorted_sets_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_commands_on_strings_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_commands_on_value_types_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_commands_requiring_clustering_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_connection_handling_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_internals_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_key_tags_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_persistence_control_commands_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_publish_subscribe_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_remote_server_control_commands_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_scripting_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_sorting_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/distributed_transactions_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/encoding_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/error_replies_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/fork_safety_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/helper.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/helper_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/internals_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/lint/blocking_commands.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/lint/hashes.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/lint/hyper_log_log.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/lint/lists.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/lint/sets.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/lint/sorted_sets.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/lint/strings.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/lint/value_types.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/persistence_control_commands_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/pipelining_commands_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/publish_subscribe_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/remote_server_control_commands_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/scanning_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/scripting_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/sentinel_command_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/sentinel_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/sorting_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/ssl_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/support/connection/hiredis.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/support/connection/ruby.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/support/connection/synchrony.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/support/redis_mock.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/support/ssl/gen_certs.sh
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/support/ssl/trusted-ca.crt
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/support/ssl/trusted-ca.key
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/support/ssl/trusted-cert.crt
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/support/ssl/trusted-cert.key
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/support/ssl/untrusted-ca.crt
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/support/ssl/untrusted-ca.key
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/support/ssl/untrusted-cert.crt
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/support/ssl/untrusted-cert.key
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/support/wire/synchrony.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/support/wire/thread.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/synchrony_driver.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/test.conf.erb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/thread_safety_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/transactions_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/unknown_commands_test.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-4.0.1/test/url_param_test.rb
Successfully installed redis-4.0.1
Downloading gem uri-redis-0.4.2.gem
GET https://rubygems.org/gems/uri-redis-0.4.2.gem
Fetching: uri-redis-0.4.2.gem (100%)
200 OK
/usr/local/rvm/gems/ruby-2.3.1/gems/uri-redis-0.4.2/CHANGES.txt
/usr/local/rvm/gems/ruby-2.3.1/gems/uri-redis-0.4.2/LICENSE.txt
/usr/local/rvm/gems/ruby-2.3.1/gems/uri-redis-0.4.2/README.rdoc
/usr/local/rvm/gems/ruby-2.3.1/gems/uri-redis-0.4.2/Rakefile
/usr/local/rvm/gems/ruby-2.3.1/gems/uri-redis-0.4.2/VERSION.yml
/usr/local/rvm/gems/ruby-2.3.1/gems/uri-redis-0.4.2/lib/uri/redis.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/uri-redis-0.4.2/try/10_uri_redis_try.rb
Successfully installed uri-redis-0.4.2
Downloading gem drydock-0.6.9.gem
GET https://rubygems.org/gems/drydock-0.6.9.gem
Fetching: drydock-0.6.9.gem (100%)
200 OK
/usr/local/rvm/gems/ruby-2.3.1/gems/drydock-0.6.9/CHANGES.txt
/usr/local/rvm/gems/ruby-2.3.1/gems/drydock-0.6.9/LICENSE.txt
/usr/local/rvm/gems/ruby-2.3.1/gems/drydock-0.6.9/README.rdoc
/usr/local/rvm/gems/ruby-2.3.1/gems/drydock-0.6.9/Rakefile
/usr/local/rvm/gems/ruby-2.3.1/gems/drydock-0.6.9/bin/example
/usr/local/rvm/gems/ruby-2.3.1/gems/drydock-0.6.9/drydock.gemspec
/usr/local/rvm/gems/ruby-2.3.1/gems/drydock-0.6.9/lib/drydock.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/drydock-0.6.9/lib/drydock/console.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/drydock-0.6.9/lib/drydock/mixins.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/drydock-0.6.9/lib/drydock/mixins/object.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/drydock-0.6.9/lib/drydock/mixins/string.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/drydock-0.6.9/lib/drydock/screen.rb
Successfully installed drydock-0.6.9
Downloading gem redis-dump-0.4.0.gem
GET https://rubygems.org/gems/redis-dump-0.4.0.gem
Fetching: redis-dump-0.4.0.gem (100%)
200 OK
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-dump-0.4.0/CHANGES.txt
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-dump-0.4.0/LICENSE.txt
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-dump-0.4.0/README.rdoc
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-dump-0.4.0/Rakefile
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-dump-0.4.0/VERSION
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-dump-0.4.0/bin/redis-dump
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-dump-0.4.0/bin/redis-load
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-dump-0.4.0/bin/redis-report
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-dump-0.4.0/gem-public_cert.pem
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-dump-0.4.0/lib/redis/dump.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-dump-0.4.0/redis-dump.gemspec
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-dump-0.4.0/try/10_redis_dump_try.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-dump-0.4.0/try/20_dump_specific_keys_try.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-dump-0.4.0/try/30_dump_base64_try.rb
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-dump-0.4.0/try/db0.json
/usr/local/rvm/gems/ruby-2.3.1/gems/redis-dump-0.4.0/try/redis.conf
/usr/local/rvm/gems/ruby-2.3.1/bin/redis-dump
/usr/local/rvm/gems/ruby-2.3.1/bin/redis-load
/usr/local/rvm/gems/ruby-2.3.1/bin/redis-report
Successfully installed redis-dump-0.4.0
Parsing documentation for drydock-0.6.9
Parsing sources...
100% [ 9/ 9]  lib/drydock/screen.rb       
Installing ri documentation for drydock-0.6.9
Parsing documentation for redis-4.0.1
Parsing sources...
100% [14/14]  lib/redis/version.rb                  
Installing ri documentation for redis-4.0.1
Parsing documentation for redis-dump-0.4.0
Parsing sources...
100% [ 3/ 3]  lib/redis/dump.rb
Installing ri documentation for redis-dump-0.4.0
Parsing documentation for uri-redis-0.4.2
Parsing sources...
100% [ 3/ 3]  lib/uri/redis.rb
Installing ri documentation for uri-redis-0.4.2
Parsing documentation for yajl-ruby-1.4.0
Parsing sources...
100% [16/16]  lib/yajl/yajl.so                 
Installing ri documentation for yajl-ruby-1.4.0
Done installing documentation for drydock, redis, redis-dump, uri-redis, yajl-ruby after 1 seconds
5 gems installed
```