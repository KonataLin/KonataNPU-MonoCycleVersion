/**
 * SBT Compile File
 * @author LocyDragon
 * @version 1.0.0-SNAPSHOT
 */
ThisBuild / scalaVersion     := "2.12.12"
ThisBuild / version          := "1.0.0-SNAPSHOT"
ThisBuild / organization     := "%ORGANIZATION%"

val chiselVersion = "5.1.0"

lazy val root = (project in file("."))
  .settings(
    name := "%NAME%",
    libraryDependencies ++= Seq(
      "edu.berkeley.cs" %% "chisel3" % "3.6.0",
      "edu.berkeley.cs" %% "chiseltest" % "0.6.0" % "test",
      "org.scalatest" %% "scalatest" % "3.2.15" % "test",
      "org.scalamacros" % "paradise_2.12.1" % "2.1.0"
    ),
    scalacOptions ++= Seq(
      "-language:reflectiveCalls",
      "-deprecation",
      "-feature",
      "-Xcheckinit",
      "-Ymacro-debug-lite"
    ),
    addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % "3.6.0" cross CrossVersion.full),
    addCompilerPlugin("org.scalamacros" % "paradise" % "2.1.1" cross CrossVersion.full)
  )
