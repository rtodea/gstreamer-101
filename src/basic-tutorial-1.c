#include <stdio.h>
#include <gst/gst.h>

#ifdef __APPLE__
#include <TargetConditionals.h>
#endif

int
tutorial_main (int argc, char *argv[])
{
    GstElement *pipeline;
    GstBus *bus;
    GstMessage *msg;

    /* Initialize GStreamer */
    gst_init (&argc, &argv);

    /* Build the pipeline */

    /* Start playing */
    pipeline =
        gst_parse_launch
        // ("playbin uri=https://gstreamer.freedesktop.org/data/media/sintel_trailer-480p.webm",
         ("playbin uri=https://download.samplelib.com/webm/sample-5s.webm",
             NULL);

    /* Take a snapshot of the pipeline */
    GST_DEBUG_BIN_TO_DOT_FILE(GST_BIN(pipeline), GST_DEBUG_GRAPH_SHOW_ALL, "pipeline_snapshot");
    gst_element_set_state (pipeline, GST_STATE_PLAYING);

    /* Wait until error or EOS */
    bus = gst_element_get_bus (pipeline);
    msg =
        gst_bus_timed_pop_filtered (bus, GST_CLOCK_TIME_NONE,
        GST_MESSAGE_ERROR | GST_MESSAGE_EOS);

    /* See next tutorial for proper error message handling/parsing */
    if (GST_MESSAGE_TYPE (msg) == GST_MESSAGE_ERROR) {
        g_printerr ("An error occurred! Re-run with the GST_DEBUG=*:WARN "
            "environment variable set for more details.\n");
    }



    /* Free resources */
    gst_message_unref (msg);
    gst_object_unref (bus);
    gst_element_set_state (pipeline, GST_STATE_NULL);
    gst_object_unref (pipeline);
    return 0;
}

int
main (int argc, char *argv[])
{
    printf("hello world\n");
#if defined(__APPLE__) && TARGET_OS_MAC && !TARGET_OS_IPHONE
    return gst_macos_main ((GstMainFunc) tutorial_main, argc, argv, NULL);
#else
    return tutorial_main (argc, argv);
#endif
}
