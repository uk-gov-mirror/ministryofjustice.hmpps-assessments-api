const { loadFile } = require('./data-files')

function loadAssessmentCsv(csvFile) {
  const all_records = loadFile(csvFile, {
    columns: false,
    relax_column_count: true,
    skip_empty_lines: true
  })
    .filter(record => record.join('')) // remove lines with no content

  // find line that contains headers
  const headerLine = all_records.findIndex(r => {
    return JSON.stringify(r).indexOf('question wording') !== -1
  })
  const footerLine = all_records.findIndex(r => {
    return JSON.stringify(r).indexOf('change notes:') !== -1
  })

  const headers = findHeaders(all_records[headerLine])
  const records = all_records.slice(headerLine + 1, footerLine || all_records.length)

  patchInAddress(records, headers)
  return { headers, records }
}

function findHeaders(headers) {
  const TITLE = headers.findIndex(field => field.match(/^question/i))
  const REF = headers.findIndex(field => field.match(/content.*ref/i))
  const QUESTION = headers.findIndex(field => field.match(/final.*wording/i))
  const ANSWER_TYPE = headers.findIndex(field => field.match(/input type/i))
  const OASYS_REF = headers.findIndex(field => field.match(/oasys ref/i))
  const OASYS_FIXED = headers.findIndex(field => field.match(/oasys fixed field/i))
  const ERROR_SUMMARY = headers.findIndex(field => field.match(/error summary/i))
  const ERROR_MESSAGE = headers.findIndex(field => field.match(/error message/i))
  const LOGIC = headers.findIndex(field => field.match(/business logic/i))
  const HINT_TEXT = headers.findIndex(field => field.match(/hint text/i))
  const REFERENCE_DATA_CATEGORY = headers.findIndex(field => field.match(/reference data category/i))
  const REFERENCE_DATA_TARGET = headers.findIndex(field => field.match(/reference data target/i))

  if ([TITLE, REF, QUESTION, ANSWER_TYPE, OASYS_REF, LOGIC, REFERENCE_DATA_CATEGORY, REFERENCE_DATA_TARGET].includes(-1)) {
    console.error(`${csvfile} does not look like I expect!`)
    process.exit(-1)
  }
  return { TITLE, REF, QUESTION, ANSWER_TYPE, OASYS_REF, OASYS_FIXED, ERROR_MESSAGE, ERROR_SUMMARY, LOGIC, HINT_TEXT, REFERENCE_DATA_CATEGORY, REFERENCE_DATA_TARGET }
}

function patchInAddress(records, headers) {
  const addressIndex = records.findIndex(r => r[headers.TITLE] === 'Address')
  if (addressIndex === -1)
    return

  // convert single line of address into five lines + postcode
  const addressLine = records[addressIndex]
  addressLine[headers.TITLE] = 'address_line_1'
  addressLine[headers.OASYS_REF] = 'current_address_line_1'
  addressLine[headers.OASYS_FIXED] = 'OFFIN/current_address_line_1'
  const ref = addressLine[headers.REF]
  const addressLines = [addressLine]
  for (let i = 1; i !== 6; ++i) {
    const notlast = i !== 5;
    addressLines.push(addressLine.map(f => f))
    addressLines[i][headers.TITLE] = notlast ? `address_line_${i+1}` : 'post_code'
    addressLines[i][headers.OASYS_REF] = notlast ? `current_address_line_${i+1}` : 'current_post_code'
    addressLines[i][headers.OASYS_FIXED] = notlast ? `OFFIN/current_address_line_${i+1}` : 'OFFIN/current_post_code'
    addressLines[i][headers.REF] = `${ref}.${i+1}`
    addressLines[i][headers.QUESTION] = notlast ? '' : 'Post Code'
    records.splice(addressIndex+i, 0, addressLines[i])
  }
}

module.exports = loadAssessmentCsv
