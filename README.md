nrpe_wrapper Cookbook
=====================

This is a nrpe wrapper cookbook that wraps the community nrpe cookbook [https://github.com/tas50/chef-nrpe](https://github.com/tas50/chef-nrpe).
This is an example wrapper cookbook, created to help teach people how wrapper cookbooks work. This is code that follows this blog post: [http://blog.safaribooksonline.com/2014/07/21/chef-wrapper-cookbooks-use/](http://blog.safaribooksonline.com/2014/07/21/chef-wrapper-cookbooks-use/).

Requirements
------------
### Chef
Chef version 0.10.10+ and Ohai 0.6.12+ are required.

### Platform
* Ubuntu 12.04

#### Cookbooks
* nrpe
* apt


Usage
-----
#### nrpe_wrapper::default

Just include `nrpe_wrapper` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nrpe_wrapper]"
  ]
}
```


License and Authors
-------------------
- Author:: Scott Pustay <scott.pustay@gmail.com>

```text
Copyright 2014, Scott Pustay

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
