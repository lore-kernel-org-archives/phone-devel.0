Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF8E3793C1
	for <phone-devel@vger.kernel.org>; Sun, 12 Apr 2026 11:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775993994; cv=none; b=lM83A2+su6AxApoddQ+zmXDLwlrreoP0JUTuF+kp8tR6pOv9IZMkJ8GaPuFnYxedxvdPvb1+Q1ooQUastvYBauGW2cvn3CoUArI9NGDXFY/3xX9nZM3VylWga0rTPPnjqzSIyB4vQkBW+M25AUuEV/ULtJRRqIoi0+NYlARJaiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775993994; c=relaxed/simple;
	bh=xrfRUIrV2OJwkuyjS0qFcxRuUcN0YbINCj7HmwcMIlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z/+Xdp16GMCsd6TiwcXCzFki3NvAefWKbRYUqpc1n5vBiYOPPIHhIOA3c9rz3obLXF+taRJBEU7ItQlGJ0+WnOgW+DAZkxBJLS3zSlH8AafZpneC505/C96KjD4EtEb8zJ4EoKIeyHNrcOrm/IkwKTCXNfRuIB3KA8sT4Hzo5N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=EG2oawCT; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="EG2oawCT"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1775993990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2OH1Z0TNgtSZYQtC6LvXeqJrvu4DIRwbjIKNvB0ZrPY=;
	b=EG2oawCT/jk/ZN0za55wTPeH9HRJaHp3JA3faX9B2saeo13p6pU/8H6cx9Xw1TSkw9jvqp
	v/SXT9DI6IgAXmdXCVoQ9thQ2Oa+Q+7wxvE1in5Me66RKJjxyDO/Lbba2jaeeUtavUVrYg
	KPIDJnkNkLadcooVV/XqzfycqblrKo5DJB7Db9HWrRny6/zICDkVcUZ4GGz58By5CLVvoY
	0wPEkZj6F4toGVzBeEsZSQAaA9pUVupFg9zWmVkH3gxzV66fPlSb9BV/A7Va1p11tWRBkd
	k0zF85IrfLzABMdZ+KL0mtg1eTVnQvidsKDTRaMUmR4dk0Fp3I7FQ0nauyldWA==
From: Val Packett <val@packett.cool>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Val Packett <val@packett.cool>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alicja Michalska <alicja.michalska@9elements.com>,
	dri-devel@lists.freedesktop.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] drm: Introduce drm_panel_prepare_for_mode callback
Date: Sun, 12 Apr 2026 08:00:44 -0300
Message-ID: <20260412113851.355944-2-val@packett.cool>
In-Reply-To: <20260412113851.355944-1-val@packett.cool>
References: <20260412113851.355944-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Modern OLED panels often need to vary their prepare commands based on the
mode being set (resolution and refresh rate). Introduce a new variant of
the drm_panel_prepare callback that passes the chosen mode as an argument
to allow for this.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/gpu/drm/bridge/panel.c |  8 ++++++--
 drivers/gpu/drm/drm_panel.c    | 15 +++++++++++++--
 include/drm/drm_panel.h        | 12 ++++++++++++
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 184a8b7049a7..58c9d9c44363 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -116,7 +116,7 @@ static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_crtc *crtc;
-	struct drm_crtc_state *old_crtc_state;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 
 	crtc = drm_atomic_get_new_crtc_for_encoder(atomic_state, encoder);
 	if (!crtc)
@@ -126,7 +126,11 @@ static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	if (old_crtc_state && old_crtc_state->self_refresh_active)
 		return;
 
-	drm_panel_prepare(panel_bridge->panel);
+	new_crtc_state = drm_atomic_get_new_crtc_state(atomic_state, crtc);
+	if (!new_crtc_state)
+		return;
+
+	drm_panel_prepare_for_mode(panel_bridge->panel, &new_crtc_state->mode);
 }
 
 static void panel_bridge_atomic_enable(struct drm_bridge *bridge,
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index d1e6598ea3bc..cc313f778253 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -112,6 +112,13 @@ EXPORT_SYMBOL(drm_panel_remove);
  * drm_panel_disable() afterwards.
  */
 void drm_panel_prepare(struct drm_panel *panel)
+{
+	drm_panel_prepare_for_mode(panel, NULL);
+}
+EXPORT_SYMBOL(drm_panel_prepare);
+
+void drm_panel_prepare_for_mode(struct drm_panel *panel,
+                                struct drm_display_mode *mode)
 {
 	struct drm_panel_follower *follower;
 	int ret;
@@ -126,7 +133,11 @@ void drm_panel_prepare(struct drm_panel *panel)
 
 	mutex_lock(&panel->follower_lock);
 
-	if (panel->funcs && panel->funcs->prepare) {
+	if (panel->funcs && panel->funcs->prepare_for_mode && mode) {
+		ret = panel->funcs->prepare_for_mode(panel, mode);
+		if (ret < 0)
+			goto exit;
+	} else if (panel->funcs && panel->funcs->prepare) {
 		ret = panel->funcs->prepare(panel);
 		if (ret < 0)
 			goto exit;
@@ -146,7 +157,7 @@ void drm_panel_prepare(struct drm_panel *panel)
 exit:
 	mutex_unlock(&panel->follower_lock);
 }
-EXPORT_SYMBOL(drm_panel_prepare);
+EXPORT_SYMBOL(drm_panel_prepare_for_mode);
 
 /**
  * drm_panel_unprepare - power off a panel
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 2407bfa60236..0c2e5232ab20 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -80,6 +80,16 @@ struct drm_panel_funcs {
 	 */
 	int (*prepare)(struct drm_panel *panel);
 
+	/**
+	 * @prepare_for_mode:
+	 *
+	 * Turn on panel and perform set up, with awareness of the mode being set.
+	 *
+	 * This function is optional.
+	 */
+	int (*prepare_for_mode)(struct drm_panel *panel,
+	                        struct drm_display_mode *mode);
+
 	/**
 	 * @enable:
 	 *
@@ -331,6 +341,8 @@ void drm_panel_add(struct drm_panel *panel);
 void drm_panel_remove(struct drm_panel *panel);
 
 void drm_panel_prepare(struct drm_panel *panel);
+void drm_panel_prepare_for_mode(struct drm_panel *panel,
+                                struct drm_display_mode *mode);
 void drm_panel_unprepare(struct drm_panel *panel);
 
 void drm_panel_enable(struct drm_panel *panel);
-- 
2.53.0

