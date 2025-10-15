#--------------------------------------------------------------------------------
# Stage 1: Build
# Uses the .NET SDK image to build the application and compile SCSS/SASS files.
#--------------------------------------------------------------------------------
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /App

# Install Node.js, npm, and sass, which are required by the .csproj targets
# to compile SCSS into CSS before the final build.
# We also clean up the apt cache in the same layer to reduce the build stage image size.
RUN apt-get update \
    && apt-get install -y nodejs npm \
    && npm install -g sass \
    && rm -rf /var/lib/apt/lists/*

# **CRITICAL COPY BLOCK:** Copy the solution file and all project files (.csproj)
# This uses a recursive copy pattern to place all .csproj files into the build context,
# maintaining the relative folder structure (e.g., BlazingTrails.Shared/BlazingTrails.Shared.csproj)
COPY BlazingTrails.sln .
# Copy all project files into their respective subfolders within /App/
COPY BlazingTrails/BlazingTrails.Shared/BlazingTrails.Shared.csproj BlazingTrails.Shared/
COPY BlazingTrails/BlazingTrails.Client/BlazingTrails.Client.csproj BlazingTrails.Client/
# UPDATED: Target the API project for the backend logic
COPY BlazingTrails/BlazingTrails.Api/BlazingTrails.Api.csproj BlazingTrails.Api/
# Restore dependencies (which will also trigger the NpmInstall target via BeforeTargets)
RUN dotnet restore

# Copy the rest of the source code
COPY . ./

# Build and publish a release. 
# This command runs all MSBuild targets, including CompileScopedScss, 
# which calls 'npm run sass'.
WORKDIR /App/BlazingTrails.Api
RUN dotnet publish "BlazingTrails.Api.csproj" -c Release -o /app/publish /p:UseAppHost=false

#--------------------------------------------------------------------------------
# Stage 2: Serve (using Nginx)
# Blazor WebAssembly is a set of static files, so Nginx is the recommended, 
# highly efficient, and lightweight runtime environment.
#--------------------------------------------------------------------------------
FROM nginx:stable-alpine AS final

# Copy the custom Nginx configuration. This is CRITICAL for Blazor WASM
# to handle client-side routing (serving index.html for all paths).
COPY nginx.default.conf /etc/nginx/conf.d/default.conf

# Copy the published 'wwwroot' content from the build stage to the Nginx web root.
# The files are located in /app/publish/wwwroot after a Release publish.
COPY --from=build /app/publish/wwwroot /usr/share/nginx/html

# The default Nginx port is 80, which we expose.
EXPOSE 80
# Nginx is started by default by the base image ENTRYPOINT.
