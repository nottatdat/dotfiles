#!/bin/bash
export CP_DIR="$HOME/src/compete/competitive-programming/"

alias pi="cd $CP_DIR && cd"
alias open_stack="ulimit -s unlimited"

nano_now() {
    return '$(python -c "import time; print(repr(time.time()))")'
}

cp_new() {
    cp "$HOME/.scripts/competitive-programming.cpp" "$1"
}

cp_compile() {
    if (( $# < 1 )); then
        echo "Usage: cp_compile source binary_output"
        return
    fi

    g++ -O2 -std=gnu++14 -march=native -Wall -Wextra -Wshadow -Wnon-virtual-dtor -pedantic "$1" -o "${2}.out"
}

announce() {
    echo "${bold}${1}${normal}: ${yellow}${2}${normal}"
}

get_success_message() {
    printf "${green}passed${normal}\n"
    return 0
}

get_failure_message() {
    printf "${red}failed${normal}\n"
    return 1
}

is_cppcheck_correct() {
    cppcheck "$1" > /dev/null
    if [ $? -ne 0 ]; then
        return get_failure_message
    fi
    return get_success_message
}

is_gcc_compilable() {
    cp_compile "$1" a
    if [ $? -ne 0 ]; then
        return get_failure_message
    fi
    return get_success_message
}

is_submitable() {
    if (( $# != 2 )) ; then
        return
    fi

    announce "$1" "$2"

    cpp_correct = is_cppcheck_correct "$2"
    gcc_compilable = is_gcc_compilable "$2"

    return cpp_correct && gcc_compilable
}

generate_test() {
    if (( $# != 2 )) ; then
        return
    fi

    for i in `seq -w $1 $2`; do
        ./c.out >> $i.in
    done
}

evaluate_solution() {
    tested=0; passed=0
    for i in *.in; do
        local start=$(nano_now)
        ./a.out < $i >> ${i%in}re
        local end=$(nano_now)
        run_time=$(echo "${end} - ${start}" | bc)

        if [ ! -f /b.out ]; then
            ./b.out < $i >> ${i%in}ok
        fi

        diff -u ${i%in}re ${i%in}ok > /dev/null
        if [ $? -ne 0 ]; then
            printf "${i%.in}: ${red}${bold}FAILED${normal}. Ran in ${red}${run_time}${normal} seconds.\n"
            printf "> Expected:\t${green}$(cat ${i%in}ok)${normal}\n"
            printf "> Got:\t\t${red}$(cat ${i%in}re)${normal}\n"
        else
            printf "${i%.in}: ${green}${bold}PASSED${normal}. Ran in ${green}${run_time}${normal} seconds.\n"
            let passed++
        fi
        let tested++
    done

    echo "Passed ${passed}/${tested} tests."
}

cp_check() {
    if (( $# > 5 )) ; then
        echo "${bold}Usage${normal}: check src_1 src_2 test_generator #_test_from #_test_to"
        return
    fi

    is_submitable "Default solution" "$1"
    if [ $? -ne 0 ]; then
        return
    fi

    if (( $# >= 2 )); then
        is_submitable "Default solution" "$2"
        if [ $? -ne 0 ]; then
            return
        fi
    fi

    if (( $# >= 3 )); then
        is_submitable "Test generator" "$3"
        if [ $? -ne 0 ]; then
            return
        fi

        generate_test $4 $5
    fi

    evaluate_solution

    rm -f *.re *.out
}

cp_clean() {
    rm -f *.in *.ok *.re *.out
}
