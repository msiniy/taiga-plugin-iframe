from taiga.base import filters
from taiga.base.api import ModelCrudViewSet
from taiga.base.decorators import list_route
from taiga.base.api.utils import get_object_or_404

from .models import IframePlugin
from .serializers import IframePluginSerializer
from .permissions import IframePluginPermissions


class IframePluginViewSet(ModelCrudViewSet):
    model = IframePlugin
    serializer_class = IframePluginSerializer
    permission_classes = (IframePluginPermissions,)
    filter_backends = (filters.IsProjectAdminFilterBackend,)
    filter_fields = ("project", "slug")

    @list_route(methods=["GET"])
    def by_slug(self, request):
        slug = request.QUERY_PARAMS.get("slug", None)
        project_id = request.QUERY_PARAMS.get("project", None)
        iframe = get_object_or_404(IframePlugin, slug=slug,
                                   project_id=project_id)
        return self.retrieve(request, pk=iframe.pk)
