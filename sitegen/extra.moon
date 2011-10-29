require "moon"

module "sitegen.extra", package.seeall
sitegen = require "sitegen"

export AnalyticsPlugin, DumpPlugin

class DumpPlugin extends sitegen.Plugin
  tpl_helpers: { "dump" }
  dump: (args) =>
    moon.dump args

class AnalyticsPlugin extends sitegen.Plugin
  tpl_helpers: { "analytics" }

  analytics: (arg) =>
    code = arg[1]
    [[<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', ']]..code..[[']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>]]
