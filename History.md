# Release History for nim-kuzu

---
## v0.6.1 [2025-07-19] Mahlon E. Smith <mahlon@martini.nu>

Bugfix:

- Prefetch query result sets into the primary query object,
  so iteration can act regularly (breaks and restarts operate
  as one would expect), and GC works properly.


Enhancement:

- Perform file magic checks for better error messaging when
  attaching to an existing disk-based database.


---
## v0.6.0 [2025-07-17] Mahlon E. Smith <mahlon@martini.nu>

Enhancement:

- Provide functions for retreiving multiple result sets from a
  single primary query object.


Minutiae:

- Add a KuzuIterationError, to disambiguate iteration errors from
  IndexErrors.


---
## v0.5.0 [2025-07-13] Mahlon E. Smith <mahlon@martini.nu>

Bump for kuzu 0.11.0.  No practical changes.


---
## v0.4.0 [2025-05-08] Mahlon E. Smith <mahlon@martini.nu>

Bump for kuzu 0.10.0.  No practical changes.


---
## v0.3.0 [2025-04-19] Mahlon E. Smith <mahlon@martini.nu>

Enhancement:

- Add `toBlob` for quickly fetching a sequence of opaque bytes.


---
## v0.2.0 [2025-04-01] Mahlon E. Smith <mahlon@martini.nu>

Well that didn't take long!  Update for Kuzu 0.9.0.

No practical changes, but there was a prepared statements
binding bugfix in the underlying lib that was biting us,
so update version to reflect the 0.9.0 release.


---
## v0.1.0 [2025-03-31] Mahlon E. Smith <mahlon@martini.nu>

Initial public release.
