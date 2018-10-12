const fs = require('fs');
const path = require('path');

const mainFilePath = path.resolve(__dirname, '../passman');
const newFilePath = path.resolve(__dirname, '../dist/passman');

console.log('Starting to parse', mainFilePath);

const mainFileContent = fs.readFileSync(mainFilePath, 'utf8');
const mainFileLines = mainFileContent.split('\n');

const substitudeLines = mainFileLines.map(line => {
  const matches = /^source (.*)$/gim.exec(line);

  if (matches) {
    const sourceFileName = matches[1];
    const sourcePath = path.resolve(__dirname, '..', sourceFileName);
    const sourceContent = fs.readFileSync(sourcePath, 'utf8');

    const regexp = new RegExp(`${matches[0]}`);
    const newLine = line.replace(regexp, sourceContent);

    return newLine;
  }

  return line;
});

const newFileContent = substitudeLines.join('\n');

fs.writeFileSync(newFilePath, newFileContent, 'utf8');

console.log('Finished bundling. Distributable is', newFilePath);
