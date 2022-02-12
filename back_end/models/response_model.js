exports.customResponse = (isOk, error, data) => {
    return {
        isOk: isOk,
        error: error,
        data: data
    }
}