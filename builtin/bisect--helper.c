#include "builtin.h"
#include "cache.h"
#include "parse-options.h"
#include "bisect.h"

static const char * const git_bisect_helper_usage[] = {
	"git bisect--helper --next-all [--bisect-mode=checkout|update-ref]",
	NULL
};

int cmd_bisect__helper(int argc, const char **argv, const char *prefix)
{
	int next_all = 0;
	int no_checkout = 0;
	char *bisect_mode=NULL;
	struct option options[] = {
		OPT_BOOLEAN(0, "next-all", &next_all,
			    "perform 'git bisect next'"),
		OPT_STRING(0, "bisect-mode", &bisect_mode, "mode",
			    "the bisection mode either checkout or update-ref. defaults to checkout."),
		OPT_END()
	};

	argc = parse_options(argc, argv, prefix, options,
			     git_bisect_helper_usage, 0);

	if (!next_all)
		usage_with_options(git_bisect_helper_usage, options);

	no_checkout = bisect_mode && !strcmp(bisect_mode, "update-ref");
	/* next-all */
	return bisect_next_all(prefix, no_checkout);
}
