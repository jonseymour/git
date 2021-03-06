NAME
====
jonseymour/git - a fork of git.

DESCRIPTION
===========

git://github.com/jonseymour/git is my public fork of the git repo.

No attempt is made to keep any of the branches stable. If you want stability, please use one of the published tags, but be prepared to rebase your work later. 

Obviously, this policy will change if and when I get any active collaborators.

BRANCHES
========

<dl>
<dt><a href="http://github.com/jonseymour/git" target="browse">master</a></dt>
<dd>The base of my working branch. Contains my stabilised dependencies. Does not contain my unpublished work in progress. Rebuilt occasionally if and when topic branches are rebased. Not suitable for use as an upstream.</dd>
<dt><a href="http://github.com/jonseymour/git/tree/work" target="browse">work</a><a name="work"/></dt>
<dd>
<p>Contains the current iteration of four proposed git commands I find useful - git work, git base, git test and git atomic. For details about this work, refer to the man pages:</p>
<ul>
<li><a href="https://jonseymour.s3.amazonaws.com/git-work.html" target="browse">git-work(1)</a></li>
<li><a href="https://jonseymour.s3.amazonaws.com/git-base.html" target="browse">git-base(1)</a></li>
<li><a href="https://jonseymour.s3.amazonaws.com/git-atomic.html" target="browse">git-atomic(1)</a></li>
<li><a href="https://jonseymour.s3.amazonaws.com/git-test.html" target="browse">git-test(1)</a></li>
</ul>
<p>
This branch will be rebuilt as the patch series is reworked.
</p>
<p>Please note also, this is just a proposal at this stage. It may yet not be accepted for inclusion in git.</p>
</dd>
<dt><a href="http://github.com/jonseymour/git/tree/jonseymour" target="browse">jonseymour</a></dt>
<dd>Contains this documentation. Maintained as a separate topic so that it doesn't infect topics I may want to deliver.</dd>
</dl>

TAGS
====

<dl>
<dt><a href="http://github.com/jonseymour/git/tree/work-20110423" target="browse">work-20110423</a></dt>
<dd>A copy of the patch series I mailed to the git list on 2011/04/23.</dd>
<dt><a href="http://github.com/jonseymour/git/tree/gitwork-v0.0.0" target="browse">gitwork-v0.0.0</a></dt>
<dd>A snapshot of work branch used to build v0.0.0 of the gitwork package. See <a href="http://github.com/jonseymour/gitwork/">gitwork</a> for more details about this package.</dd>
</dl>

HOW I MAINTAIN THIS DOCUMENT
============================
When ever I edit this document, I do:

     git add README.md
     git commit -m "Updates to README"
     git work update jonseymour HEAD~1   # updates jonseymour with the last commit, 
                                         # merges that commit with $(git base)
                                         # rebases remaining unpublished work on that
     git push public $(git base):master jonseymour:jonseymour # updates github with my (relatively) stable work

The net effect is that:

* My changes to README.md go to my jonseymour branch.
* My public github branch reflects the work I have stabilised with **git work update** - it contains my stable dependencies, but not work in progress.
* I keep my work in progress rebased on top of my public github master branch.
* I keep my unpublished work private.
* My working tree remains stable - **git work update** doesn't change the tree, it only changes the history. 

