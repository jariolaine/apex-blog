# Product Context

## Reader experience

Readers find posts through the main blog, categories, tags, archives, and
search. They can read related content and use the comments, links, and file
repository features that the blog enables.

Saving a post alone does not determine its public visibility. Drafts and
scheduled publication belong to the editorial workflow. Public visibility
also depends on whether the post, blogger, and category are active; the
implementation is described in [Post visibility](systemPatterns.md#post-visibility).

## Editorial experience

Authorized bloggers prepare rich-text posts, organize them, manage comments
and files, and control application settings and features. The administration
interface exposes content states that readers do not see, so authors can work
on unpublished content and understand why a post is not currently public.

The [post-properties page](../applications/blog-admin/pages/p00012-post-properties.apx)
connects rich-text editing and optional assisted writing to the content later
rendered by the public application.

## Configurable workflows

Comment submission, moderation, reply subscriptions, and language analysis
have feature-dependent paths in the
[comment page](../applications/blog/pages/p01001-comment.apx).
An enabled feature and its disabled state can lead to different user flows.

External services extend assisted writing, comment analysis, file storage,
and sign-in. The available experience depends on the application's settings
and enabled features; every installation need not use every integration.

## Installation and upgrade experience

People installing the blog include beginners and citizen developers, and may
have access only to App Builder in a browser. The intended experience is to
import the application exports and follow understandable Supporting Objects
prompts for installation or upgrade.

The application-file order, required choices, and success or failure messages
should be clear. Recipients should not need to understand development tooling
or choose individual database patches. The package's
[database lifecycle](systemPatterns.md#packaged-database-lifecycle) defines
which upgrade scripts apply.
