using System.Web;
using System.Web.Optimization;

namespace Site
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {

            /*
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js",
                        "~/Scripts/jquery-ui-{version}.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new StyleBundle("~/assets/css").Include(
                      "~/assets/css/bootstrap.css",
                      "~/assets/css/neon-core.css",
                      "~/assets/css/neon-theme.css",
                      "~/assets/css/neon-forms.css",
                      "~/assets/css/custom.css"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js",
                      "~/Scripts/modal_form.js",
                      "~/Scripts/custom.js"));
                      */
            bundles.Add(new StyleBundle("~/assets/css").Include(
                      "~/bootstrap/css/bootstrap.min.css",
                      "~/plugins/jquery-ui/jquery-ui-1.10.2.custom.css",
                      "~/assets/css/main.css",
                      "~/assets/css/plugins.css",
                      "~/assets/css/responsive.css",
                      "~/assets/css/icons.css",
                      "~/assets/css/fileinput.css",
                      "~/assets/css/fontawesome/font-awesome.min.css"
                      ));

            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                    "~/assets/js/libs/jquery-1.10.2.min.js",
                    "~/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js",
                    "~/bootstrap/js/bootstrap.min.js",
                    "~/assets/js/libs/lodash.compat.min.js",
                    "~/Scripts/modal_form.js",
                    "~/Scripts/custom.js"));

        }
    }
}
