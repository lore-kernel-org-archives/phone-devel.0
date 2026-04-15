Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636A83491C9;
	Wed, 15 Apr 2026 21:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776288610; cv=none; b=O5bcmpdX7BxHg9H7N/A0hziHMAim5dBqWR8yLwvaw6pyQF9uUtsWM81WIZ0jncbnsi83xkJC6WbGdySTesL3sBlaKvTpmRaHLPGuxIRX0KS3Wnyf6DkGhjD6bk/Sl33PUID2ID5kVWYID5zCIRu/qvpF1eh0gRofv0vYd9KgmUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776288610; c=relaxed/simple;
	bh=wWh9BFGSeePJdiAQl4B72hJgYrgbq4DhVBsbTMTNLKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fdJ6pEh/TsWegYWMHuB9jVJ4qwP1X48DEUrH/8JeWqxauepLAfZjxKPpZW3x39bzWcAcqx0JGvhg8FVHALLTiqBguM/fTeY4O583rxFLr/cNk3eOR6hmm519PLP/iG1/B11jzyzoO6ihcQ2KbybS+EjjBTXyAiSxWa62R5K4Dpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYOFxehO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYOFxehO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10AEEC19424;
	Wed, 15 Apr 2026 21:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776288610;
	bh=wWh9BFGSeePJdiAQl4B72hJgYrgbq4DhVBsbTMTNLKU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=MYOFxehO/Vwd0XZv9BTiZC8Z0NTyqjS3Cr5uMISkx3g5dCCJqAT9bQuwAlyi3PzzH
	 WMmHir7I7O8lFyNO9M/k3EO6rdoEQseSkkMK0V/WrPbq1pCzu5Wo5RbIEAYfWvXncF
	 VJOLAZ9tkdqkrZ2Z0ePfJaelpGS5WCttHT4OhnfaQ8zfDO2c7f+n/WXCyltIRQh+1V
	 c45corIYFUMw/Xty9OEnz/ZiHGiU4+eRfzbYe/KVNC4kgDveIhzpoNPWYJ4/3xaHvA
	 os4iSxoij9L1LxPiDvpUczMVR790VrK3n5zKB4e8w51yMQkLNNibfV/TT5iPDl8S+D
	 +RoCCBWUYOlTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89F5F433C9;
	Wed, 15 Apr 2026 21:30:09 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 15 Apr 2026 23:30:05 +0200
Subject: [PATCH] drm/panel: visionox-rm69299: Make use of
 prepare_prev_first
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260415-axolotl-display-v1-1-7abb2d248355@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAF0D4GkC/x3MQQqAIBBA0avErBM01KKrRAvRqQYkQyMM8e5Jy
 7f4v0DCSJhg7gpEfChROBtE34E9zLkjI9cMAx80l0Ixk4MPt2eO0uXNy0ahLEqhUdkJWnVF3Cj
 /x2Wt9QMaKA/jYQAAAA==
X-Change-ID: 20260415-axolotl-display-715ce416e5c8
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1248; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=bF7lrbD9lXIuwu2O8jm2gideODLb8OyFdzCi29iX97M=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp4ANgdDifmNfMWBOu+NsugDOUVuFeFEJSZeEVn
 fmxJqsjIJKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaeADYAAKCRBgAj/E00kg
 cvRlD/9WtZm5zQDZ+cGcDnNwbkI7VpIUXrL3lvwzDUdTsj6D16FeQ03ji8oROCHp36ZOzLZbd4a
 OuOdcT3ujSQWnk3yk/+O4uhuCEBouxuRpSmhKrnvBtSpzTIvnARZbnX+Z88/97X53bNRouSiImj
 hg1B2zuhjkr5vbjUP6t3C9l6RbisS4BhSYh2otzbS1oAat9lCs7QMS5m2R4QxES0bVdBuEuCqvR
 4F+Uc9nVJiVwTfsmEu0Xg0gnWNtzi+R+Lssxn8AtDYTUXFw25frSojydgX5u7OcLRJbc0SMsCXJ
 OE6f5/FD/YGqzqbNNRSghshvIsJt7V2m4d5Vcfsi7hjWuRJOJ6etPpd5eYxW41XLBx9kQSIdHaZ
 TGxcaVD/KZaPLUI2U932sxQ1yMVdnfOXOsehXp+F01oALKde00WiVYHVmOMXTeE68gXXCCmAwVs
 8IRDa/H8+BO0Y/94/Usw3WvXpPIY/4ZkcYdNHkVW4VEVwdxDJFht8op6qjScfj8Y3Yz2i7CrA+K
 +62e5VZMP0X4AKtLR3lx4+Yus6u8qeBqsKAb9lcRJZtNjI8oQifhDQDPeiWcaOduCKpxpq6gz5i
 V3NJne1oyksIqiGidAmzQLjyLKewE1JLL2jdD2qV+XjUsBypCh2BwtBpn8rYFZ6CpNjAHNPPbNj
 EtbUhI6QE3FLh0A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Guido Günther <agx@sigxcpu.org>

The DSI link must be powered up to let panel driver to talk to the panel
during prepare() callback execution. Set the prepare_prev_first flag to
guarantee this.

Fixes: 9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering up DSI hosts at modeset")
Signed-off-by: Guido Günther <agx@sigxcpu.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index e5e688cf98fdc..0e33454650d13 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -387,6 +387,7 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	ctx->panel.prepare_prev_first = true;
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
 		dev_err(dev, "dsi attach failed ret = %d\n", ret);

---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260415-axolotl-display-715ce416e5c8

Best regards,
-- 
David Heidelberg <david@ixit.cz>


