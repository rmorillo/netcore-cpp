#!/usr/bin/env sh
dotnet build
dotnet test
dotnet publish -o dist
cp scripts/run.sh dist/run.sh