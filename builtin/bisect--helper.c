#include "builtin.h"
#include "cache.h"
#include "parse-options.h"
#include "bisect.h"

static const char * const git_bisect_helper_usage[] = {
	"git bisect--helper --next-all [--update-ref=<ref>]",
	NULL
};

int cmd_bisect__helper(int argc, const char **argv, const char *prefix)
{
	int next_all = 0;
	char *update_ref = NULL;
	struct option options[] = {
		OPT_BOOLEAN(0, "next-all", &next_all,
			    "perform 'git bisect next'"),
		OPT_STRING(0, "update-ref", &update_ref, "ref",
			    "update <ref> instead of checking out the current commit"),
		OPT_END()
	};

	argc = parse_options(argc, argv, prefix, options,
			     git_bisect_helper_usage, 0);

	if (!next_all)
		usage_with_options(git_bisect_helper_usage, options);

	/* next-all */
	return bisect_next_all(prefix, update_ref);
}
