local mason_registry = require 'mason-registry'
local lombok_jar = mason_registry.get_package('jdtls'):get_install_path() .. '/lombok.jar'

local config = {
  cmd = {
    '/Users/sidnguye/.local/share/nvim/mason/bin/jdtls',
    string.format('--jvm-arg=-javaagent:%s', lombok_jar),
  },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
