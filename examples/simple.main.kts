#!/usr/bin/env kotlin
@file:DependsOn("com.github.ajalt.clikt:clikt-jvm:4.4.0")
import com.github.ajalt.clikt.core.CliktCommand
import com.github.ajalt.clikt.parameters.options.*
import com.github.ajalt.clikt.parameters.types.int

class Hello : CliktCommand() {
    val count: Int by option().int().default(1).help("Number of greetings")
    val name: String by option().prompt("Your name").help("The person to greet")

    override fun run() {
        repeat(count) {
            echo("Hello $name!")
        }
    }
}

Hello().main(args)
