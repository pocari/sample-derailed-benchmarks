## build

```
docker compose build
```

## run

```
docker compose up
```


## memo
`/todos` でメモリリークするコードになっているので、そこに対してチェック

```
PATH_TO_HIT=/todos HTTP_HOST=localhost RAILS_ENV=development bundle exec derailed exec perf:mem_over_time
```

でメモリリークしていくのが確認できる。

実際にどのファイルでメモリ使用量が多いかは

```
PATH_TO_HIT=/todos HTTP_HOST=localhost RAILS_ENV=development bundle exec derailed exec perf:objects
```
で確認でき、メモリリークするコードを埋め込んだ箇所が表示される
```

allocated memory by location
-----------------------------------
   2621768  /usr/src/app/app/controllers/todos_controller.rb:7
     30633  /usr/local/bundle/gems/activerecord-6.0.6.1/lib/active_record/log_subscriber.rb:105
     22352  /usr/local/lib/ruby/2.7.0/ipaddr.rb:651
     21872  /usr/local/lib/ruby/2.7.0/ipaddr.rb:597
     12964  /usr/local/bundle/gems/activesupport-6.0.6.1/lib/active_support/backtrace_cleaner.rb:96
```

todo_controller.rb
```
  1 $hoge = []
  2 class TodosController < ApplicationController
  3   before_action :set_todo, only: %i[ show edit update destroy ]
  4
  5   # GET /todos or /todos.json
  6   def index
  7     $hoge += 100000.times.map {|i| i }
```
