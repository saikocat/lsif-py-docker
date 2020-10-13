FROM python:3.8-alpine3.12

ARG LSIFPY_SHA256=9788c31118558ab582669a2862670dd3481e14cb

WORKDIR /work

RUN apk --no-cache add curl

RUN curl -L https://github.com/sourcegraph/lsif-py/archive/${LSIFPY_SHA256}.tar.gz \
        | tar -zxv --strip-components=1

# Python 3.8 doesn't play well with jedi==0.16.0. Bypassing the install_requires
RUN pip install --use-feature=2020-resolver --no-deps .

# Patch requirement jedi==0.17.2
COPY requirements.txt requirements.txt
RUN pip install --use-feature=2020-resolver -r requirements.txt
# it will complain like below but safe to ignore
# ERROR: lsif-py 0.0.1 requires jedi==0.16.0, but you'll have jedi 0.17.2 which is incompatible.

COPY "entrypoint.sh" "/entrypoint.sh"
CMD ["lsif-py"]
ENTRYPOINT ["/entrypoint.sh"]
