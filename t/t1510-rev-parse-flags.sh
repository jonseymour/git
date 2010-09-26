#!/bin/sh
#
# Copyright (c) 2010 Jon Seymour
#

test_description='test git rev-parse --flags'
. ./test-lib.sh

test_commit "A"

test_expect_success 'git rev-parse --flags -> ""' \
'
	>expected &&
	git rev-parse --flags >actual &&
	test_cmp expected actual
'

test_expect_success 'git rev-parse --flags X -> ""' \
'
	>expected &&
	git rev-parse --flags X >actual &&
	test_cmp expected actual
'

test_expect_success 'git rev-parse --no-revs --flags HEAD -> ""' \
'
	>expected &&
	git rev-parse --no-revs --flags HEAD >actual &&
	test_cmp expected actual
'

test_expect_success 'git rev-parse --flags HEAD -> sha1 of HEAD' \
'
	git rev-parse HEAD > expected &&
	git rev-parse --flags HEAD >actual &&
	test_cmp expected actual
'

test_expect_success 'git rev-parse --flags -- -> ""' \
'
	>expected &&
	git rev-parse --flags -- >actual &&
	test_cmp expected actual
'

test_expect_success 'git rev-parse --flags -- X -> ""' \
'
	>expected &&
	git rev-parse --flags -- X >actual &&
	test_cmp expected actual
'

test_expect_success 'git rev-parse --flags -- -X -> ""' \
'
	>expected &&
	git rev-parse --flags -- -X >actual &&
	test_cmp expected actual
'

test_expect_success 'git rev-parse --flags -- -q --> ""' \
'
	>expected &&
	git rev-parse --flags -- -q >actual &&
	test_cmp expected actual
'

test_expect_success 'git rev-parse --flags -X -> "-X"' \
'
	printf "%s\n" -X > expected &&
	git rev-parse --flags -X >actual &&
	test_cmp expected actual
'

test_expect_success 'git rev-parse --flags -X -- Y -Z -> "-X"' \
'
	printf "%s\n" -X > expected &&
	git rev-parse --flags -X -- Y -Z >actual &&
	test_cmp expected actual
'

test_expect_success 'git rev-parse --no-flags --flags -X -> ""' \
'
	>expected &&
	git rev-parse --no-flags --flags -X >actual &&
	test_cmp expected actual
'

test_expect_success 'git rev-parse --symbolic --no-flags --flags HEAD -> "HEAD"' \
'
	echo HEAD >expected &&
	git rev-parse --symbolic --no-flags --flags HEAD >actual &&
	test_cmp expected actual
'

test_expect_success 'git rev-parse --flags -q -> ""' \
'
	>expected &&
	git rev-parse --flags -q >actual &&
	test_cmp expected actual
'

test_expect_success 'git rev-parse --flags --no-flags -> ""' \
'
	>expected &&
	git rev-parse --flags --no-flags >actual &&
	test_cmp expected actual
'

test_expect_success 'git rev-parse --no-revs file -> "file"' \
'
	echo foo >file &&
	echo file >expected &&
	git rev-parse --no-revs file >actual &&
	test_cmp expected actual
'

test_expect_success 'git rev-parse --no-revs -- not-a-file -> "-- not-a-file"' \
'
	cat >expected <<-EOF &&
--
not-a-file
	EOF
	git rev-parse --no-revs -- not-a-file >actual &&
	test_cmp expected actual
'

test_done
