Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB333B47D9;
	Mon, 10 Aug 2026 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355743; cv=none; b=Trwy/rA2lmfx+YPZIwUeq02xp8RFpCIaNC2GboXosAYjoqcj8/Zf3SjXodalumF3gin2cGTdMH8m5v6yzh9kJQ4rMWsGsxomDikotJrvBY2Spo80jb0xy4O9K8VtAbztbFec8Mn7mzu38rDewJKCucoaylNCoagliHGglVVlR0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355743; c=relaxed/simple;
	bh=Bowpf5/pvv+5XsQhGmAgRnTtq9swcIDJArfdD0iEFUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nlRipmLsUCTnpIKy1EbAX02HGHMkUxbOzXA6d91qLKQ0Epjbtou8+Pm/Fww55vctcNjA8CsF9xJXw7WgsksgwCA62PMDvnUpp8y1EVC04DC3QRa0iHhXJVV7+xvmHjJjZoj7tCLIijwSJvL6+y1s8+5iFgFhSXOmN1ckH5wHcvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BdlyOso0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BdlyOso0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF665C2BCFA;
	Mon, 10 Aug 2026 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786355742;
	bh=Bowpf5/pvv+5XsQhGmAgRnTtq9swcIDJArfdD0iEFUE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BdlyOso0B4McvQe/cnE6EKBioXOJ9NbJmPHbvkJD+1ErZcu+JO+Mm6kGykBocjG5H
	 Uohucq5kVHxSkeYwcGKq1VdoJuClgf9Kk57Q889MB/IbXmnyBjinPu6aC9Hwc1CrLS
	 530K4I8ffS4Ab6tiO993d3DfYLZrqG//vv7pKjV0g3ixH1kEW4LceDa05jEKndUaHU
	 fAITzLm6hAjo8lgYQvCbrsRUgWYvFLnMnC78x97KO7xSpeR2AVcvrGDETHmpnwkTGS
	 j9Sn129ZYPgZcJWkByS9kHurJJ3BtNf8jD22fD7HDTiF2XRltfSM6Z6kTMibu3yFEe
	 d/WD16sV3P9eQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F34DC5AC82;
	Mon, 10 Aug 2026 09:55:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 10 Aug 2026 11:55:38 +0200
Subject: [PATCH v2 2/2] drm/panel: lg-sw43408: use the full DCS brightness
 range
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-fix-blueline-panel-v2-2-9344dfdbc3f9@ixit.cz>
References: <20260810-fix-blueline-panel-v2-0-9344dfdbc3f9@ixit.cz>
In-Reply-To: <20260810-fix-blueline-panel-v2-0-9344dfdbc3f9@ixit.cz>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=scglJ6aSldaji48JvrBM5A5u97auNkDSvGSlJqKRe5k=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqeaAc3VgRZEOaTM54OKlXYIzYbhoEhA65NKcDg
 1Hc3lGC9UaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCanmgHAAKCRBgAj/E00kg
 cg7OD/40s8ISIFOnNA0G1UHYJYr6xaE0We5PGFZzosOsifznr43Ec3S+ss3FAnXBQ69OX8RTwVs
 kJb+U1thvNoo9EDrtBgyvaBZrGGSYyjxo9VmtLgytOxVi482WD3RG4LuZkgaWu81GUDwZ9zYSVy
 NO4/xXC3HARtYloGwunPGDZHOhOiz3iC+qScKC6ccLtUKa3jApxVtzMspF4rrIQQxJ2d+e6NNGV
 gokA/gVp71z/tNSNCv1vftLCqn/nji/w/Iq7iJEi+7QdMhQyMdN94H9Jz5/Pf7gdl07F/tz8GCz
 MJdsjurpIJbesWJhUNuy7nhnjGQw3g7YSOsHSrFPwuJSRSfzh4EIVzy9G168FdLV6WVuChMhLx5
 bp0kQHbgrafoO1jtErlieC6lncLujZQt4MqORy2SD346WkN0cgWiFMREJPGBoBWcPgJxBjEXKaa
 mVTlnbJJThZ6SM81TKPVBjwouCw6auCzBwKpFmGr3do+kg7a+AICrGrcbKijzQTi2XYC58kVkV8
 gK5XqCPRd5Cf8XA2GCSk4eZvVzomoul2uVz0F+ReyHpOdZelZI84QLXtHMS9yOOe6OhIsTKn4PF
 cXaXsNGbwJVrGhDCEBHxjx87SEKxH2BIGrrFgHM5QHH7A86C2Bokwea9FARk28AgNI2q9NF/T4/
 ilWGZFgvrZMA/7Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The vendor firmware panel configuration (XBL DisplayDxe panel XML)
declares DCSMaxBrightness 0x332 with a two-byte brightness command,
and the driver already sends two bytes via
mipi_dsi_dcs_set_display_brightness_large().

Capping max_brightness at 255 therefore limits the panel to ~31% of
its real brightness range. Use the firmware maximum.

Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 0bf8e08f10b9c..be132b65b0c13 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -203,17 +203,17 @@ static const struct backlight_ops sw43408_backlight_ops = {
 };
 
 static int sw43408_backlight_init(struct sw43408_panel *ctx)
 {
 	struct device *dev = &ctx->link->dev;
 	const struct backlight_properties props = {
 		.type = BACKLIGHT_PLATFORM,
 		.brightness = 255,
-		.max_brightness = 255,
+		.max_brightness = 818,
 	};
 
 	ctx->base.backlight = devm_backlight_device_register(dev, dev_name(dev), dev,
 							     ctx->link,
 							     &sw43408_backlight_ops,
 							     &props);
 
 	if (IS_ERR(ctx->base.backlight))

-- 
2.55.0


