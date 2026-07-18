local mason = vim.fn.stdpath 'data' .. '/mason'

local config = {
  cmd = {
    mason .. '/bin/jdtls',
    '--jvm-arg=-javaagent:' .. mason .. '/packages/jdtls/lombok.jar',
  },
  root_dir = vim.fs.root(0, { 'gradlew', '.git', 'mvnw' }),
}
require('jdtls').start_or_attach(config)
