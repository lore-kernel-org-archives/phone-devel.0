Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795723042;
	b=xuWiuHa9vnzHXuUp3xfgUa3J51NsSv5/sbTtdTitu1JNJcPOwha/H0UkNvDK9hrBbob/
	 C58AiKHsdyrFyxHdBJ8VT7cs/7WBE0+Q7yBqyJCcrHR8He17wtoWEcVfvcPcWZ5ivW1tl
	 QmY2eQkWE63Mpc0l/V2BFEbriko2szifxRes4NntlwazgAO2N9ykfxhdeoZu0ugIZil5V
	 M0CEFkJF7WVGdwvXCnnw3azBNtpkvRL+QstbOJMx8yHEvU4BVOjssciH+Q9UG6xQJXkX9
	 +RZOlFGj2w7rW+TXM0kqXQ0Y1FBbgNZTL04AuHDr/YsRnJE64/+AhBbap+1Ce8ZE/0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795723042;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=tk1KhXd10B4pwSxpWhg43HfuTXpuyII0XqoWxTChEsM=;
	b=22MR2CC1heHG42wtoEm0kv+MUraePmNDxUvPIppPlWSaezVwlNZFGCO4OxtycGw8p8+7
	 EjSkUbaxuYN+DSB5iZONJ+Dg/HoqgvWkZWLye5Bu9/xpj+IJgRKZq0wX1w1Ap4LrCKFvM
	 06d0JgG/GUG+lkrgaNiue7MZHICIOvWEbOyybeZcvY36OUda9R7MGVb0L35V9IXfmwOMd
	 E/cq9jASeSqfINOlM5J3gDsg5MhHYbzGUzn+VR2RtYRnM4q0+EE+RCWG9Ejkohnda2fx9
	 0Nds2ONFKLAeeeP6WdQIg8xqZj6A7veURB5e1k7t68keCwQSQl2XgpHwv9PbgMmvdoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMiJQQoU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FABC606A321;
	Thu, 26 Nov 2026 19:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMiJQQoU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795723042;
	b=mtYBYpcV/lFEZdC+kFyCT7OqS013oAqdcOkde/h1Sr1FLt8k/745WKtJITAB1VUVY8vn
	 jgkQamwnT5ltuW1Q2nlUr8JugNx/9LwCmO8KfpE9YSSuc8UObe3JrWmSZ8hMofC5+IEGN
	 263yBLUX9XUO8VXXBQQoFCRhXrbItfDNRR1VOwh3j1H7e0JI+gFNOqepwzdZ9Nu6MA6qz
	 CaYgb2bdLd82X9fEVFPes2dOa377F7eH+EueT7vUjGQxebjMAKkXUbWsZgcZs2fIu3RO9
	 hiKgELHuepoDmQL+8HbySrBHtQjW7fUgqddn0lYKBvmmHnMze8nliYdNOW8ub43wl+w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795723042;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=tk1KhXd10B4pwSxpWhg43HfuTXpuyII0XqoWxTChEsM=;
	b=QbWCznIhy66g7PGVX9insvVSjkAgCKzCBfDEOEnXjpGjmBOxN7dQ9SazyeCsm9vQ6sNY
	 d68fqRZYNHfFV/WN6Ze0+/xFGsFMIf3lwJFzbkVlcy3QDgehfpAbp1cEwPYdbmNkjfyrH
	 /f+NL1Be2b+xpt+45fOQv0BbPBX2q5R/Yj3ar0RmiurzQ2SirNr7ZpWo6ojRe9kop0f98
	 vL9CSf6DhueHJNNN/0+XfKAinTJQk8fQbeLK9NiTm3Rl4VNoAKPK4suslGR48QGBXh3YN
	 O7KpSoalUzmO73iWtJOq0k3es00olL7X6e4/Zu3kSLEdtyYjHP7oQEFejkcfvT+Dyyg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 922F31F000CA;
	Thu, 26 Nov 2026 19:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795723042;
	bh=tk1KhXd10B4pwSxpWhg43HfuTXpuyII0XqoWxTChEsM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BMiJQQoUMzwT8oUGdNCPRFKzbJlcPPVjvyA+GPHV4HaI2HC12E5RMp1KmN3vUGie/
	 EifYFUG+185MpM5ySLLowk0bJeFC5RKl2uKJ7ul1jspXgLMqS2jzl5zxaHltS3fv4d
	 NUO9scMUOpLT17UkBcBL6VYYsj8pYkAyTRRvuD8qGujRce7L7SWZOHuZkq18My0Mc5
	 LjzCiCpjcJZ2rAYAQH8drW4PeH00TY5QduiV7emKgFrcVymf+Q1P4rs3B93nbuBcoV
	 R44NykasGMNN46AiMFqJSqMtlg8PTCSauoUeeDFUW7ZMKpLqKPSe1am5/u04rELrkn
	 YhrQsHvg5jAdg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1E7924D7E0;
	Thu, 26 Nov 2026 19:57:09 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 26 Nov 2026 20:57:07 +0100
Subject: [PATCH v2 2/2] drm/panel: visionox-rm69299: Move power_off() into
 unprepare()
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261126-visionox-rm69299-enable-v2-2-d4aca6d50b05@ixit.cz>
References: <20261126-visionox-rm69299-enable-v2-0-d4aca6d50b05@ixit.cz>
In-Reply-To: <20261126-visionox-rm69299-enable-v2-0-d4aca6d50b05@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Douglas Anderson <dianders@chromium.org>
Cc: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Alexander Martinz <amartinz@shiftphones.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ZKlt2J9SJtaagBBmDdD9/bxAqIHPNUXlK1gRO/z3ohk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrCI8UvC0CJAMi5XXibNlumI2RiN5xcYwHe7Q8B
 hClARDVFZ+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawiPFAAKCRBgAj/E00kg
 ciPdD/46lqiyAIrbOjBbe1l36hKM1I6ZpUFn4Fivcoc2UuFfG1wcKM17gGr47FjumPZv0SvnzpA
 kh1iEAygfQZwdzq5tIbdOV4KqGnaWoIN8rkVuO/UUnMKpbhYhc5lK1gR7WcjhemWb0LWAMa27od
 CDsI9iHR4E3mx/YHKx1SKeUMG9NLMfdcuvkvojL6frhktXRIkcITR1D01wbRsKiBFVC5BHo80oJ
 arpaUVzBWnVSzRVP/+LHhhAx4MLXZtp0u/ZqH8jHTO3YvbGO9Vam+A0tZXmQUtERC5OGz05V92H
 oA8amxoGB7SELA11/TBvkKE1jRwrLJvKnNqFDOjitvF1PBpU31HjG5jb/EP/o0As7z98/IqUdaB
 9nRZIs/od24vL4EydmPN7k51HM5JvOeOIYXZjhj9qxJL07zNpRzaZz0bwvFhtgxpMHRuHo2p5pO
 t3u2T5YjcHUsDZeJsvOIQ8lNvNhrYbXmnAwc0WmBGu9Vi6O4mF5NhuRLYdt9mYbfZdfJVR7KBuF
 aWadmqsbiohHPJ5op71mIMjI8WolgpPdjg4x1gpWrpTwHCENt5Vqhpzj8bLvGZby5s3qJTWvScA
 JU/ioTyId7QW37eI6PhZqI44aFtJ9cuzx5wkJVPgyrrpeN6rKc7gYBClAMNtt2dnhh4sWKZQaCI
 hylf1iWxr6C4k3Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Guido Günther <agx@sigxcpu.org>

No need to have a separate visionox_rm69299_power_off() helper now that
visionox_rm69299_unprepare() only handles powering off the panel.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
[David: only fold power_off() into unprepare(), keeping power_on() in prepare()]
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index bca1004656e45..54005d4660c33 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -176,24 +176,16 @@ static int visionox_rm69299_power_on(struct visionox_rm69299 *ctx)
 	gpiod_set_value(ctx->reset_gpio, 0);
 	usleep_range(10000, 20000);
 	gpiod_set_value(ctx->reset_gpio, 1);
 	usleep_range(10000, 20000);
 
 	return 0;
 }
 
-static int visionox_rm69299_power_off(struct visionox_rm69299 *ctx)
-{
-	gpiod_set_value(ctx->reset_gpio, 0);
-
-	return regulator_bulk_disable(ARRAY_SIZE(visionox_rm69299_supplies),
-				      ctx->supplies);
-}
-
 static int visionox_rm69299_disable(struct drm_panel *panel)
 {
 	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 
 	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
 	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
@@ -205,17 +197,20 @@ static int visionox_rm69299_disable(struct drm_panel *panel)
 
 	return dsi_ctx.accum_err;
 }
 
 static int visionox_rm69299_unprepare(struct drm_panel *panel)
 {
 	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
 
-	return visionox_rm69299_power_off(ctx);
+	gpiod_set_value(ctx->reset_gpio, 0);
+
+	return regulator_bulk_disable(ARRAY_SIZE(visionox_rm69299_supplies),
+				      ctx->supplies);
 }
 
 static int visionox_rm69299_prepare(struct drm_panel *panel)
 {
 	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 	int ret, i;
 

-- 
2.55.0


