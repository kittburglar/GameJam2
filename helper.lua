helper = {}

function helper.isPointInRect(pointx, pointy, rectx, recty, rectwidth, rectheight)
	return pointx > rectx and pointx < (rectx + rectwidth) and pointy > recty and pointy < (recty + rectheight)
end