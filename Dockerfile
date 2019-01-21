FROM node:10-slim

LABEL version="1.0.0"
LABEL repository="http://github.com/actions/npm"
LABEL homepage="http://github.com/actions/npm"
LABEL maintainer="GitHub Actions <support+actions@github.com>"

LABEL com.github.actions.name="GitHub Action for npm with git"
LABEL com.github.actions.description="Wraps the npm CLI to enable common npm commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"
COPY LICENSE README.md THIRD_PARTY_NOTICE.md /

RUN apt-get update && apt-get install -y git

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
