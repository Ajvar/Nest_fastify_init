#! /bin/sh
if [ -z "$1" ]
	then
		nest new app
		cd app
else
	if [ -d "$1" ]; then
		echo "${1} already exists"
		exit 1
	fi
	nest new "$1"
	cd "$1"
fi

npm i --save @nestjs/platform-fastify @nestjs/core @nestjs/common rxjs reflect-metadata @nestjs/swagger
npm i @fastify/static
npm i --save-dev webpack-node-externals run-script-webpack-plugin webpack
cp ../webpack-hmr.config.js .
awk '/start:dev/{gsub(/nest start --watch/, "nest build --webpack --webpackPath webpack-hmr.config.js --watch")};{print}' package.json > package.jsonnew
mv package.jsonnew package.json
mv ../main.ts ./main.ts

#Dependencies

npm install --save-dev joi @types/joi
