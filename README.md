This project is a working demo of using Spring Security plugins with Grails.
============================================================================

Versions
--------

 * Grails: 2.0
 * Spring Security Core: 1.2.7.1
 * Spring Security Ui: 0.1.2

Steps followed in developing this project
-----------------------------------------

1. Generate the Grails project: `grails create-app G2SSExample`
2. Add plugin dependencies for Spring Security plugins in `grails-app/conf/BuildConfig.groovy` (I also updated Resources plugin to use latest version).
3. Run the following command to install the plugins: `grails refresh-dependencies`
4. The above command generates warnings about runtime dependencies not defined within the plugin. So add the runtime dependencies for "mail", "jquery-ui" and "famfamfam" in `grails-app/conf/BuildConfig.groovy`.
5. Run the following command: `grails s2-quickstart <package-name> <name-for-user-domain-class> <name-for-role-domain-class>` and verify the entries added in `grails-app/conf/Config.groovy`. Example: `s2-quickstart me.vith User Role`
6. Run Spring Security Ui's `s2ui-override` script for generating registration related code: `s2ui-override register me.vith`
7. Modify the style of `grails-app/views/login/auth.gsp` to be consistent with the rest of the site.
8. Modify `grails-app/views/register/index.gsp` using GSP tags and HTML to be consistent with rest of the site.
9. Similarly modify `forgotPassword.gsp` and `resetPassword.gsp` in `grails-app/views/register` directory.
10. Now with the views ready, we'll look into the registration workflow. For this app, I have used the greenmail plugin as I don't want to send real messages. For this, I added a plugin dependency in `grails-app/conf/BuildConfig.groovy` and defined an SMTP port in `grails-app/conf/Config.groovy` as required by the plugin. So all emails sent (in this case for registration, forgot password) are viewable at http://localhost:8080/G2SSExample/greenmail in development.
11. With all this in place, there are a few things to fix in the `RegisterController` of *spring-security-ui* plugin. In this app, I have copied the entire contents of the plugin's controller into the `RegisterController` within my application. We will now modify this controller. (Making changes in the plugin's controller will only work locally as when you run the code on another machine the plugins are pulled from central repository).
First, the passwords are now encoded by spring-security-core at the domain level. So we can remove `the encodePassword()` calls in `RegisterController`. Failing to do so will result in double-encryption of passwords. Next, there are a few lookup\* calls in the controller which was throwing an exception when I tried it. Since we already know the classes we are using for user, role and the join (User, Role and UserRole), we will directly use them and get rid of the lookup\* calls.


With all these done, we should have the app running with all registration-related work-flows working well. Try following the git commits chronologically as they roughly correspond to the steps above.
