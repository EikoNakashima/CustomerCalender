const { environment } = require('@rails/webpacker')

environment.config.resolve.alias = { 'vue$': 'vue/dist/vue.esm.js' }

const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: 'popper.js'
  })
)


module.exports = environment
