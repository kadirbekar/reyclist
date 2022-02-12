exports.customResponse = (isOk, error, data) => {
    return {
        isOk: isOk,
        message: error,
        data: data
    }
}