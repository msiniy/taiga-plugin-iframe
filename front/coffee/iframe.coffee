@.taigaContribPlugins = @.taigaContribPlugins or []


# decorator for tgProjectMenuDirective
# appends plugin buttons to the project menu
decorator = ($delegate, $templateCache, $route, $tgRepo) ->
	directive = $delegate[0]
	compile = directive.compile;
	directive.compile = (tElement, tAttrs) ->
		link = compile.apply(this, arguments)
		# append buttons to menu
		tElement.append($templateCache.get('contrib/iframe-menu.html'))
		return (scope, elem, attrs) ->
			link.apply(this, arguments)
			# extend link function here
			promise = $tgRepo.queryMany("iframe_by_slug",  {"pslug": $route.current.params.pslug})
			promise.then (iframes) =>
				scope.iframes = iframes
				return
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
			promise.then (iframes) =>
				scope.values = iframes
				return

class Iframe
	@.$inject = [
		"$rootScope",
		"$scope",
		"$tgRepo",
		"$route",
		"$sce",
	]
	constructor: (@rootScope, @scope, @repo, @route, $sce) ->
		slug = @route.current.params.islug
		@scope.trustSrc = (src) -> 
			$sce.trustAsResourceUrl(src)
		@scope.trustHtml = (html) ->
			$sce.trustAsHtml(html)
		# find iframe
		promise = @repo.queryOne("iframe", "by_slug", {pslug: @route.current.params.pslug, slug: @route.current.params.islug})
		promise.then (iframe) =>
			@scope.iframe = iframe

module = angular.module('taigaContrib.iframe', [])
module.controller("ContribIframeAdminController", IframeAdmin)
module.controller("ContribIframeController", Iframe)

initIframePlugin = ($tgNavUrls, $tgUrls) ->
	$tgNavUrls.update({
		"project-iframe": "/project/:project/iframe/:iframe"
	})
	$tgUrls.update({
		"iframe": "/iframe",
		"iframe_by_slug": "/iframe/by_slug"
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
