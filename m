Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BDE15A864
	for <phone-devel@vger.kernel.org>; Mon, 15 Jun 2026 00:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781482115; cv=none; b=iG8a425IP+HbA6Hefp6wsAaMA0CEGntoK8MIskeE5VIrhlM+q5UfJcdYF62tcZQiyYOeWbXhb0Kve+5qgerhI5gA+jXZL804/ORh8xN5hU9Er1Pfy6osBTU/dWGv+/Ih5245j43llJff+eLbgy9d1mJit7cTANtSvnLdE5QanRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781482115; c=relaxed/simple;
	bh=BDw7Bx1ORT01TsUDlYJYJXG5JR/GfgAstzhn4sX0/hI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bc62uGCKUux2gwUHawl29jHBTo8zokcqySy43txGGNtj5qdfowChn2qosChZSR6YQpy6tpwMlNp8jjp3UO7iY2teycoSnHwLzBWJRcS5FQrbW8JPEPh1KGbe5Ke/ROm3iwkOYk3gHDpvLWusK1fC4WabTgyvo92OICd8WCEmq7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=OOqHe8it; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="OOqHe8it"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1781482112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bEOca1jOqHZbX0GtYqdPn35QDLy7m1CGEih1VnaStwc=;
	b=OOqHe8itbNzq87k02GS7iQNhzTnmoKvwSJdT9jcvqazK56sGWrEHIV7oKhj6gBuTlwT6F7
	QCN8u1kJyPLUSMyDR7e47olx310tRPNrxaqEzYkXuuIG8nOTSSUQJIey6PUDOxK0uQttvr
	hEcTF7YUYwBihj/7o/qydrbAkN/VbZU/MxKELe0AWwl9K71niwqx3V4oRgmLMjwbf7ebX5
	KuAQN8CGf6z3Zfwox6UdjaXP9ECpC42yipb/FFka17DBoSdIAaI1jtjsGE7wzg9yfbal4D
	2B/M8SxfkdujEOoV4GQfbHsrGf4MbVdhiWhIm00L7yG0ZMGhFH8IQwPYgf4y6Q==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 14 Jun 2026 17:08:00 -0700
Subject: [PATCH v3 3/4] MAINTAINERS: add Paul Sajna as maintainer for
 lg,sw49410-lh609qh1
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260614-judyln-panel-v3-3-07f4134441bd@postmarketos.org>
References: <20260614-judyln-panel-v3-0-07f4134441bd@postmarketos.org>
In-Reply-To: <20260614-judyln-panel-v3-0-07f4134441bd@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 phone-devel@vger.kernel.org, Amir Dahan <system64fumo@tuta.io>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781482095; l=837;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=BDw7Bx1ORT01TsUDlYJYJXG5JR/GfgAstzhn4sX0/hI=;
 b=duXyRGQyB3p/9b77c9i4fs3+B4Rer1oQ8lwzCtD1cTEwK21ZXaTiZhAGNNMYUb7yKceUCUXku
 CtUyO9OAjuKD/QZD6KSuWND3s+ayD0hEgvAJCJIkJLsvazYA38U6WpD
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Add myself (Paul Sajna) as maintainer for lg,sw49410-lh609qh1

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c9f2780b2d31..5c043fb66af0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8134,6 +8134,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
 F:	drivers/gpu/drm/panel/panel-lg-sw43408.c
 
+DRM DRIVER FOR LG SW49410 PANELS
+M:	Paul Sajna <sajattack@postmarketos.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/lg,sw49410.yaml
+F:	drivers/gpu/drm/panel/panel-lg-sw49410.c
+
 DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
 M:	Paul Kocialkowski <paulk@sys-base.io>
 S:	Supported

-- 
2.54.0

