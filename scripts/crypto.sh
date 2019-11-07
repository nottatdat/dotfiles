GPG_UID="taurandat"

encrypt() {
    if (( $# < 1 )); then
        echo "Usage: encrypt folder_name"
        exit 1
    fi

    folder_name=$1
    tar czf "${folder_name}.tar.gz" "${folder_name}"
    rm -rf $folder_name  # Clean up
    gpg -e -r $GPG_UID "${folder_name}.tar.gz"
    rm "${folder_name}.tar.gz"  # Clean up
}

decrypt() {
    if (( $# < 1 )); then
        echo "Usage: decrypt file_name"
        exit 1
    fi

    file_name=$1
    gpg -d -o "${file_name:0:(-4)}" "${file_name}"
    tar xzvf "${file_name:0:(-4)}"
    rm "${file_name:0:(-4)}"  # Clean up
}

pcat () {
    if (( $# < 1 )); then
        echo "Usage: pcat file"
        return
    fi

    cat "$1" | pbcopy
}

genpass () {
    length=64
    if (( $# >= 1 )); then
        length=$1
    fi

    cat /dev/urandom | base64 | fold -w "$length" | head -n 1 | pbcopy
}
