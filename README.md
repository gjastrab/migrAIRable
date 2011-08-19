If you are serializing custom classes to disk in your AIR application, what will you do when you want to add an additional field to a class? The readExternal function would not properly read this new field if it was present. What if you wanted to reorder the serialization order of the class? Then the readExternal class would throw a runtime error due to your code trying to read the wrong data type.

The solution: MigrAIRable classes:

1. Add the migrAIRable SWC to your project
2. Have your IExternalizable class extend MigrAIRable
3. Set the version string in the constructor of your class
4. Add namespace functions to parse according to the version string that was read

It's that easy!

This library [won the Adobe AIR Cook-off](http://blog.smartlogicsolutions.com/2008/10/29/i-won-the-air-cook-off/) in 2008.  Here's a blog post [announcing the initial release](http://blog.smartlogicsolutions.com/2008/09/11/migrating-serialization-changes-within-an-air-application/).
