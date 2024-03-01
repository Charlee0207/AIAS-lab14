import sbt.Keys._

def scalacOptionsVersion(scalaVersion: String): Seq[String] = {
  Seq() ++ {
    // If we're building with Scala > 2.11, enable the compile option
    //  switch to support our anonymous Bundle definitions:
    //  https://github.com/scala/bug/issues/10047
    CrossVersion.partialVersion(scalaVersion) match {
      case Some((2, scalaMajor: Long)) if scalaMajor < 12 => Seq()
      case _ => Seq("-Xsource:2.13")
    }
  }
}

def javacOptionsVersion(scalaVersion: String): Seq[String] = {
  Seq() ++ {
    // Scala 2.12 requires Java 8. We continue to generate
    //  Java 7 compatible code for Scala 2.11
    //  for compatibility with old clients.
    CrossVersion.partialVersion(scalaVersion) match {
      case Some((2, scalaMajor: Long)) if scalaMajor < 12 =>
        Seq("-source", "1.7", "-target", "1.7")
      case _ =>
        Seq("-source", "1.8", "-target", "1.8")
    }
  }
}

//Setting Key ： Project Information 
organization := "edu.playlab"

name := "acal_lab14"

version := "0.1.0"

scalaVersion := "2.13.8"

libraryDependencies += "edu.berkeley.cs" %% "chisel3" % "3.5.4"

libraryDependencies += "edu.berkeley.cs" %% "chisel-iotesters" % "2.5.4" % "test"

libraryDependencies += "edu.berkeley.cs" %% "chiseltest" % "0.5.4" % "test"

addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % "3.5.4" cross CrossVersion.full)

scalacOptions ++= Seq("-deprecation", "-feature", "-unchecked", "-language:reflectiveCalls") ++ scalacOptionsVersion(scalaVersion.value)

javacOptions ++= javacOptionsVersion(scalaVersion.value)

Compile / unmanagedSourceDirectories  += baseDirectory.value / "top_entry"