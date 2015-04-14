# base-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['base']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### base::default

Include `base` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[base::default]"
  ]
}
```

## License and Authors

Author:: Juan Carlos Alonso Holmstron (j.carlos.alonso.h@gmail.com)
# berks_basecookbook

Please don't forget to install this vagrant plugins:

* omnibus (4.0.0)
* vagrant-berkshelf (4.0.3)
* vagrant-share (1.1.3, system)
* vagrant-vbguest (0.10.0)

And for to be able to test instalation

* chefdk (dont use rvm o rbenv, use embeded ruby on chefdk, a may example view in https://downloads.chef.io/chef-dk/ )