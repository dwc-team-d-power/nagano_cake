const { environment } = require('@rails/webpacker')

module.exports = environment
<<<<<<< HEAD

=======
>>>>>>> d69b0a6a577f4bfacf493168e4d85500223be6fb
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)