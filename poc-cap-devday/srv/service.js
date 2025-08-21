const cds = require('@sap/cds');

module.exports = cds.service.impl(function () {
    this.on('testDebug', async (req) => {
        return { message: 'Hello from CAP service!' };
    });
});