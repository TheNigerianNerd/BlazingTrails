# See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

# This stage is used when running from VS in fast mode (Default for Debug configuration)
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443


# This stage is used to build the service project
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
ARG BUILD_CONFIGURATION=Release
# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs
WORKDIR /src
COPY ["BlazingTrails.Api/BlazingTrails.Api.csproj", "BlazingTrails.Api/"]
COPY ["BlazingTrails.Shared/BlazingTrails.Shared.csproj", "BlazingTrails.Shared/"]
COPY ["BlazingTrails.Client/BlazingTrails.Client.csproj", "BlazingTrails.Client/"]
RUN dotnet restore "./BlazingTrails.Api/BlazingTrails.Api.csproj"
COPY . .

# Ensure the Client dependencies are installed
WORKDIR /src/BlazingTrails.Client
RUN npm install

WORKDIR "/src/BlazingTrails.Api"
RUN dotnet build "./BlazingTrails.Api.csproj" -c $BUILD_CONFIGURATION -o /app/build

# This stage is used to publish the service project to be copied to the final stage
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./BlazingTrails.Api.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# This stage is used in production or when running from VS in regular mode (Default when not using the Debug configuration)
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

# 1. Create the directory explicitly
RUN mkdir -p /app/Persistence/Data

# 2. Copy the database file
COPY ["BlazingTrails.Api/Persistence/Data/blazingtrails.db", "/app/Persistence/Data/blazingtrails.db"]

# 3. Grant full permissions to the Data folder
# This ensures SQLite can create its temporary journal files
RUN chmod -R 777 /app/Persistence/Data

RUN mkdir -p /app/Images && chmod -R 777 /app/Images

ENTRYPOINT ["dotnet", "BlazingTrails.Api.dll"]