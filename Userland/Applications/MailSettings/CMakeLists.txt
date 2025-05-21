denlab_component(
    MailSettings
    RECOMMENDED
    TARGETS MailSettings
)

compile_gml(MailSettingsWidget.gml MailSettingsWidgetGML.cpp)

set(SOURCES
    main.cpp
    MailSettingsWidget.cpp
    MailSettingsWidgetGML.cpp
)

denlab_app(MailSettings ICON app-mail)
target_link_libraries(MailSettings PRIVATE LibConfig LibCore LibGfx LibGUI LibMain)
