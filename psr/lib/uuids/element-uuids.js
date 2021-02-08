const { v4: uuid } = require('uuid')
const { DataFile } = require('../data-files')

class ElementUuids {
  constructor(csvFile) {
    this.csvFile = csvFile
    this.uuids = DataFile.load(this.csvFile)
  }

  lookup(ref, title) {
    let existing = true
    if (!this.uuids[ref]) {
      existing = false
      this.uuids[ref] = uuid()
      DataFile.append(this.csvFile, title, ref, this.uuids[ref])
    }
    return [this.uuids[ref], existing]
  }
}

module.exports = csvFile => new ElementUuids(csvFile)
