
.PHONY: images
images:
	@podman run -it \
		--env CONTAINER_HOST=unix:///var/run/podman.sock \
		-v "${XDG_RUNTIME_DIR}/podman/podman.sock:/var/run/podman.sock:Z" \
		-v "./images":/app \
		-w /app \
		podman:latest \
		sh /app/build.sh

.PHONY: iso
iso:
	@podman run -it \
		--cap-add=sys_admin,mknod --device=/dev/fuse \
		--env CONTAINER_HOST=unix:///var/run/podman.sock \
		-v "${XDG_RUNTIME_DIR}/podman/podman.sock:/var/run/podman.sock:Z" \
		-v "./iso":/app \
		-w /app \
		mkiso:latest \
		mkiso build


