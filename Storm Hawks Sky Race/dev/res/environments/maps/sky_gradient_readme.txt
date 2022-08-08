sky_gradient.dds should not be compressed to DXT3 format (the default dds format).

To generate a proper .dds file for the sky_gradient, you need the sky_gradient.texformat file in the same directory. That file should contain the following:

<root>
    <format>    A8R8G8B8    </format>
</root>
