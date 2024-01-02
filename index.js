const core = require('@actions/core');
const exec = require('@actions/exec');

async function run() {
    try {
        const directory = core.getInput('folder');
        const branch = core.getInput('branch');
        const target = core.getInput('target');

        await exec.exec(`${src}/build.sh -d ${directory} -b ${branch} -t ${target}`);
    } catch (error) {
        core.setFailed(error.message);
    }
}

run();