The sample code is based on this article https://medium.com/@xaviergeerinck/how-to-bind-c-code-with-dotnet-core-157a121c0aa6 and enhanced to work with use Docker and simplify the build process.

<h2>Build docker containers</h2>

docker build -t dotnetcore-build -f build.Dockerfile .
<br/>
docker build -t dotnetcore-run -f run.Dockerfile .

<h2>Build, test and publish application</h2>

docker run -v ${pwd}:/home dotnetcore-build

<h2>Run application</h2>

docker run -v ${pwd}/dist:/home dotnetcore-run
