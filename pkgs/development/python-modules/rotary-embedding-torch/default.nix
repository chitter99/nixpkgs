{ lib
, buildPythonPackage
, fetchFromGitHub

# build-system
, setuptools
, wheel

# dependencies
, einops
, torch
}:

buildPythonPackage rec {
  pname = "rotary-embedding-torch";
  version = "0.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lucidrains";
    repo = "rotary-embedding-torch";
    rev = "refs/tags/${version}";
    hash = "sha256-bwRfu3SM/+Y9B06vjwqOjd9YmmO+EwBVvhWSdHTaRAk=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  propagatedBuildInputs = [
    einops
    torch
  ];

  pythonImportsCheck = [
    "rotary_embedding_torch"
  ];

  doCheck = false; # no tests

  meta = with lib; {
    description = "Implementation of Rotary Embeddings, from the Roformer paper, in Pytorch";
    homepage = "https://github.com/lucidrains/rotary-embedding-torch";
    license = licenses.mit;
    maintainers = teams.tts.members;
  };
}
