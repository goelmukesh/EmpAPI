FROM microsoft/dotnet:2.0-sdk
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore
#RUN dotnet build

# copy and build everything else
COPY . ./
RUN dotnet publish -c Release -o out

ENV ASPNETCORE_URLS=http://+:80
#EXPOSE 8080
# COPY ./out .
ENTRYPOINT ["dotnet", "out/EmployeeAPI.dll"]