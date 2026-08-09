Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFC5D531;
	Sun,  9 Aug 2026 00:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786233873; cv=none; b=M6ipn5c/EfPV7oUlwUeeg8GosFHmPZ7q6aC4i3cAzlxc89u5giIvkDqowWQE3V/wBX5pRbUXbLm1ESHNTtDz14UxvjHa5rgzIxnNnZX3VhET8Rp/UfQQx6g/1g8wTMFM2aDSSw2f1Xb+xPUfK+2+xjDlfgeuizJgESp4NKu5+Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786233873; c=relaxed/simple;
	bh=cnjW0OV5yEuMWySyTpsZRr+wpmPAX3P799FsmymAxdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p3WtrEVIzHhOEPnbX5lD1n9booogBeWnwWuTB7+l0NxZdQeIuZ5zhJGahFwOfHn78ZHV0XYdGYPbQwhejF7JXgMZQzuitakSlntuzuik0mgYJeRJgxOP3aHad5FhBA3P4KiGM+GVVSl91hNEt7Y97SDBpR+9BU+a+RiEwkdCtrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQgoIgyw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQgoIgyw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6C29C2BCF6;
	Sun,  9 Aug 2026 00:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786233873;
	bh=cnjW0OV5yEuMWySyTpsZRr+wpmPAX3P799FsmymAxdA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QQgoIgywMIpadYR4TP4094IJGbcE9vj7QZF+fKzPSa6xEPMncZ6JcLP/92mBLEtYM
	 2Cxc4ScJ5ZlMoXM2nEZvCAg4vR3YwZWC6OIimKM+V3y8vLPcdSLmTxuKfmQldE94ws
	 g7GolwWqr6F9ubi/3A8SWtV44BXHtqi2Dpk57PSADJXCt08XSqtEbCMwMfbUe3HnDn
	 idxfQpBADsCo0o6hJEFMAuTECDOxp3ekkcJW6y7DNIdMQvKv2ImRhQoxisffO6QJAy
	 aPYO3m7abDo1xJZgrsfYNSpy+UKIJIf47SYjtRYdfJS0rn4U10cplFinRG6aP1wnF6
	 L7P5eljWe9mtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6648C5AD4E;
	Sun,  9 Aug 2026 00:04:32 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 09 Aug 2026 02:04:29 +0200
Subject: [PATCH 1/2] drm/panel: lg-sw43408: do not assert reset across
 unprepare
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-fix-blueline-panel-v1-1-e7f3a6beb1fa@ixit.cz>
References: <20260809-fix-blueline-panel-v1-0-e7f3a6beb1fa@ixit.cz>
In-Reply-To: <20260809-fix-blueline-panel-v1-0-e7f3a6beb1fa@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2463; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=vaTzxrXfaQrlrCdE0j9EYWvjB43LMXXQ+G8L9Lh3xSA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqd8QP1mp4a1fJi/0SGyhfU3kakYdv1RCwF5Z7Y
 5fYQdyoLf+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCanfEDwAKCRBgAj/E00kg
 cq8QD/4nUf5vmQp8+4Zal7U3Px51MFdTKG+Af0nUi7kBwInQQ/rGFHVnWjfkwqTeXb2QEC7+eGK
 AHR186QIKzUWvUG1e4WzoCqq+hp/0UCz8+l5gX0enjMGBNmYzUbIjqTOwt2MnVt3sNOn6+kOl0t
 cg0KIMTdy6KZaVhYsRqWtEHoRvjtO06k546UfiYIQL+kG3QwUPYC857QMQc4E8nBdQxE9lEWJ6s
 4u7G9Wntg7SwJeETBSuk43K8aOVCJswIqfAfzMMdyMozUz+rhp3XPpZuw5Yfeu+iJUZi8ytgRyh
 DljCC77POyGZJ/iUeQBz5zka/yl/NHDeFwFWqgbriu8AUuFy75Ey+7E7ehAX+Mt3KFUplGrcOTo
 31bIrc1RV70c1SAkQpb4MVzpV6MkuGjPtFRAlsnSeIxWsYNukf463K827PblRouxNDuqNMZGdWU
 amDjRD7NYAXhVReNixv/jzaBkI0pLWKtN6arM4Yao8IrTT6HoWr6kFqJEs/s6C+tbWmZPP6/4IN
 fPBirHAsZQzcyKot2xZ7edjX+GvdNwBi6LNZ1f5ldsneT6nE4COv/ZDSAWjnNqDStcKqmvz40Ff
 wM7X1S4MhMjYTWl7YRPZv93CEbyYBuUMpmCIXn7c8s5P027dN9dbB3sReXM2UoWAd5pertrOHID
 uEz3PvmdfF3h4qQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Asserting the reset GPIO in unprepare() and leaving it asserted puts
the DDIC into a state it never recovers from: after the following
prepare() the panel answers all DCS commands, reports display-on with
clean self-diagnostics, and its configuration registers read back
identical to a working panel, but it never lights up again.

On the Pixel 3, vddi is shared with the touchscreen controller and
remains powered while the panel is off, so with this driver the DDIC
sits in reset with its logic rail up for the whole blank period - a
state the vendor stack never creates: the vendor firmware only toggles
reset as part of a full power-on sequence, and the vendor OS never
power-cycles the panel at all (LP mode is used instead).

Leave reset alone in unprepare(); prepare() performs the regular reset
sequence anyway.

Without this, the Pixel 3 display never comes back after the first
blank/unblank cycle.

Since there isn't any other panel or device using this DDIC, this
approach seems resoanble to address the issue.

Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index 293826c5006b9..0bf8e08f10b9c 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -50,18 +50,24 @@ static int sw43408_unprepare(struct drm_panel *panel)
 	int ret;
 
 	mipi_dsi_dcs_set_display_off_multi(&ctx);
 
 	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
 
 	mipi_dsi_msleep(&ctx, 100);
 
-	gpiod_set_value(sw43408->reset_gpio, 1);
-
+	/*
+	 * Keep reset deasserted: vddi may stay powered (it is shared with
+	 * the touchscreen on Pixel 3) and holding the DDIC in reset while
+	 * its logic rail is up puts it into a state that no init sequence
+	 * recovers from - the panel keeps answering DCS commands and
+	 * reports display-on, but never lights up again. The vendor stack
+	 * only ever toggles reset as part of a powered-up init sequence.
+	 */
 	ret = regulator_bulk_disable(ARRAY_SIZE(sw43408_supplies), sw43408->supplies);
 
 	return ret ? : ctx.accum_err;
 }
 
 static int sw43408_program(struct drm_panel *panel)
 {
 	struct sw43408_panel *sw43408 = to_panel_info(panel);

-- 
2.55.0


