@.taigaContribPlugins = @.taigaContribPlugins or []
# FIXME! It's a stub, load iframes from backend
IFRAMES_STUB = [
	{
		icon: "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"
		title: "Вестник Бури", 
		slug: 'vb', 
		url: "http://vestnikburi.com", 
		order: 0
	},
	{
		icon: "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",
		title: "HipChat",
		slug: 'chat', 
		url: "https://vestnik.hipchat.com/chat",
		order: 1
	}
]

# decorator for tgProjectMenuDirective
# appends plugin buttons to the project menu
decorator = ($delegate, $templateCache) ->
	directive = $delegate[0]
	compile = directive.compile;
	directive.compile = (tElement, tAttrs) ->
		link = compile.apply(this, arguments)
		# append buttons to menu
		tElement.append($templateCache.get('contrib/iframe-menu.html'))
		return (scope, elem, attrs) ->
			link.apply(this, arguments)
			# extend link function here
			scope.iframes = IFRAMES_STUB
			return
	return $delegate

decoratorInfo = {
	type: "decorator",
	provider: "tgProjectMenuDirective",
	decorator: decorator
}

@.taigaContribPlugins.push(decoratorInfo)

IframeInfo = {
	slug: "iframe",
	name: "Iframe",
	type: "admin",
	module: 'taigaContrib.iframe'
}

@.taigaContribPlugins.push(IframeInfo)


class IframeAdmin
	@.$inject = [
		"$rootScope",
		"$scope",
		"$tgRepo",
		"tgAppMetaService",
		"$tgConfirm",
		"$tgHttp",
	]

	constructor: (@rootScope, @scope, @repo, @appMetaService, @confirm, @http) ->
		@scope.sectionName = "Iframe"
		@scope.sectionSlug = "iframe"
		scope = @scope
		@scope.$on "project:loaded", =>
			promise = @repo.queryMany("iframe", {project: @scope.projectId})
			promise.catch (e) ->
				scope.values = IFRAMES_STUB

class Iframe
	@.$inject = [
		"$scope",
		"$tgRepo",
		"$route",
		"$sce",
	]
	constructor: (@scope, @repo, @route, $sce) ->
		scope = @scope
		slug = @route.current.params.islug
		#promise = @repo.queryOne("iframe", "by_slug", {project: @route.current.params.pslug, slug: @route.current.params.islug})
		scope.trustSrc = (src) -> 
			$sce.trustAsResourceUrl(src)
		# find iframe
		iframe = _.find(IFRAMES_STUB, (i) ->
			i.slug == slug
		)
		scope.iframe = iframe

module = angular.module('taigaContrib.iframe', [])
module.controller("ContribIframeAdminController", IframeAdmin)
module.controller("ContribIframeController", Iframe)

initIframePlugin = ($tgNavUrls, $tgUrls) ->
	$tgNavUrls.update({
		"project-iframe": "/project/:project/iframe/:iframe"
	})
	$tgUrls.update({
		"iframe": "/iframe"
	})
	return

module.run(["$tgNavUrls", "$tgUrls", initIframePlugin])

module.config( ($routeProvider) ->
	$routeProvider.when("/project/:pslug/iframe/:islug",
		{
			templateUrl: "contrib/iframe-show.html",
			loader: true,
			controller: "ContribIframeController",
			controllerAs: "vm"
		}
	)
)
