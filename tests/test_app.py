from fastapi_k8s_app.main import r


def test_root_response():
    assert r() == {"ok": True}
