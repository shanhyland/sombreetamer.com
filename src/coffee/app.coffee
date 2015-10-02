require 'zepto'
require 'zepto-detect'

console.log $.os

$('video source').remove() if $.os.phone
