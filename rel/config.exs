# Import all plugins from `rel/plugins`
# They can then be used by adding `plugin MyPlugin` to
# either an environment, or release definition, where
# `MyPlugin` is the name of the plugin module.
Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: Mix.env()

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev1 do
  set dev_mode: true
  set include_erts: false
  set vm_args: "rel/vm.args"
  set cookie: :"!ed3sw0aaST2z46(oww2b@@H>YW)Rt)zn8~wd%WT6WoFb2MYed:tyUPZ1=$qPa$S"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"%h?QkPuoHK;RFk4r4&z.GF%Mye*c|:e?o!;zcW>Efj6`,c^T5kgr5>GxEr3rv.uF"
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :epoch_elixir do
  set version: "0.1.0"
  set applications: [
    :runtime_tools,
    aecore: :permanent,
    aehttpclient: :permanent,
    aehttpserver: :permanent
  ]
end
