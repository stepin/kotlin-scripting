#!/bin/sh
///bin/echo >/dev/null <<EOC
/*
EOC
kotlinc -script -Xplugin="${KOTLIN_HOME}/lib/kotlinx-serialization-compiler-plugin.jar" -- "$0" "$@"
exit $?
*/
// NOTE: this script is for Kotlin 2.0 as kotlinx-serialization-json:1.7.0 require it
@file:DependsOn("org.jetbrains.kotlinx:kotlinx-serialization-json:1.7.0")
@file:DependsOn("com.github.ajalt.clikt:clikt-jvm:4.4.0")

import com.github.ajalt.clikt.core.CliktCommand
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json

@Serializable
data class Data(val a: Int, val b: String)

val json = Json.encodeToString(Data(42, "str"))
val obj = Json.decodeFromString<Data>(json)


class Hello : CliktCommand() {
    override fun run() {
        println(json)
        println(obj)
    }
}

Hello().main(args)
